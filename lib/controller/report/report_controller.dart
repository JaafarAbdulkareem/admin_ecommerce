import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/report/report_remote.dart';
import 'package:admin_ecommerce/data/models/report/order_per_city_model.dart';
import 'package:admin_ecommerce/data/models/report/product_category_pie_model.dart';
import 'package:admin_ecommerce/view/widget/report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

import 'package:admin_ecommerce/core/constant/constant_path.dart';
import 'package:admin_ecommerce/data/models/report/item_grid_model.dart';

abstract class ReportController extends GetxController {}

class ReportControllerImp extends ReportController {
  final keyPage1 = GlobalKey();
  final keyPage2 = GlobalKey();

  late StatusRequest statusRequest;
  late final ReportRemote _reportRemote;
  late ReportModel reportData;
  late List<ItemGridModel> gridData;
  late List<FlSpot> monthlySeries;
  late List<OrdersPerCityModel> cityData;
  late List<ProductCategoryPieModel> categoryData;

  late final AlertDefault _alert;
  late bool isClickSave;

  @override
  onInit() {
    statusRequest = StatusRequest.initial;
    _reportRemote = ReportRemote(curd: Get.find());
    _alert = AlertDefault();
    isClickSave = false;
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await _reportRemote.getData();
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        fetchData(response[ApiResult.data]);
        checkDataLength();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
    }
  }

  fetchData(response) {
    reportData = ReportModel.fromJson(response);
    _initialDat();
  }

  void _initialDat() {
    gridData = <ItemGridModel>[
      ItemGridModel(
        title: KeyLanguage.titleUserUsing.tr,
        count: reportData.dashboardCounts.totalUsers,
        color: AppColor.usersUsing,
      ),
      ItemGridModel(
        title: KeyLanguage.titleDeliveries.tr,
        count: reportData.dashboardCounts.totalDeliveryMen,
        color: AppColor.deliveries,
      ),
      ItemGridModel(
        title: KeyLanguage.titleActiveProduct.tr,
        count: reportData.dashboardCounts.activeProducts,
        color: AppColor.activeProducts,
      ),
      ItemGridModel(
        title: KeyLanguage.titleInactiveProduct.tr,
        count: reportData.dashboardCounts.inactiveProducts,
        color: AppColor.inactiveProducts,
      ),
      ItemGridModel(
        title: KeyLanguage.titleOrders.tr,
        count: reportData.dashboardCounts.totalOrders,
        color: AppColor.order,
      ),
    ];

    monthlySeries = reportData.monthlyOrders
        .map((e) => FlSpot(e.month.toDouble(), e.month.toDouble()))
        .toList();

    cityData = reportData.ordersPerCity.toList();

    categoryData = reportData.productCategoryPie.toList();
  }

  void checkDataLength() {
    if (_hasValidData()) {
      statusRequest = StatusRequest.success;
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  bool _hasValidData() {
    // Customize your validation logic based on your ReportModel structure.
    return reportData.dashboardCounts.totalUsers > 0 ||
        reportData.dashboardCounts.totalDeliveryMen > 0 ||
        reportData.dashboardCounts.activeProducts > 0 ||
        reportData.dashboardCounts.inactiveProducts > 0 ||
        reportData.dashboardCounts.totalOrders > 0 ||
        reportData.monthlyOrders.isNotEmpty ||
        reportData.ordersPerCity.isNotEmpty ||
        reportData.productCategoryPie.isNotEmpty;
  }

  /// Capture widget image from a key
  Future<Uint8List?> _captureWidget(GlobalKey key) async {
    try {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      await Future.delayed(const Duration(milliseconds: 200));
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint("❌ Error capturing widget: $e");
      return null;
    }
  }

  /// Request and handle storage permission
  Future<bool> _requestStoragePermission() async {
    if (!Platform.isAndroid) return true;

    final status = await Permission.manageExternalStorage.request();

    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      await _alert.dialogPhoneDefault(
        title: KeyLanguage.alertTitlePermission.tr,
        body: KeyLanguage.alertMessagePermission.tr,
        onConfirm: () {
          openAppSettings();
        },
      );
    }

    return false;
  }

  /// Get or create download directory
  Future<String> getTargetDirectoryPath() async {
    if (Platform.isAndroid) {
      final directory = Directory(ConstantPath.pathDownloadAndroid);
      if (!await directory.exists()) {
        try {
          await directory.create(recursive: true);
        } catch (e) {
          _alert.snackBarDefault(
            icon: AppIcon.error,
            body: "${KeyLanguage.alertErrorPermission.tr}$e",
          );
          rethrow;
        }
      }
      return directory.path;
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Capture both pages and generate multi-page PDF
  Future<void> captureFullWidgetToPdf() async {
    if (!isClickSave) {
      isClickSave = true;
      update([ConstantKey.idDownloadPdf]);
      if (!await _requestStoragePermission()) {
        _alert.snackBarDefault(
          icon: AppIcon.warning,
          title: KeyLanguage.alertTitleDeniedPermission.tr,
          body: KeyLanguage.alertMessageDeniedPermission.tr,
        );
        return;
      }

      final image1 = await _captureWidget(keyPage1);
      final image2 = await _captureWidget(keyPage2);

      if (image1 == null || image2 == null) {
        _alert.snackBarDefault(
          icon: AppIcon.error,
          body: KeyLanguage.alertMessageCapture.tr,
        );
        return;
      }

      final pdf = pw.Document();
      final img1 = pw.MemoryImage(image1);
      final img2 = pw.MemoryImage(image2);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (_) => pw.Center(child: pw.Image(img1)),
        ),
      );

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (_) => pw.Center(child: pw.Image(img2)),
        ),
      );

      try {
        final path = await getTargetDirectoryPath();
        final file = File('$path/${ConstantPath.pdfReportName}');
        await file.writeAsBytes(await pdf.save());

        _alert.snackBarDefault(
          icon: AppIcon.success,
          title: KeyLanguage.alertTitleSuccess.tr,
          body: KeyLanguage.alertMessageSuccessPdf.tr,
        );

        await OpenFile.open(file.path);
      } catch (e) {
        _alert.snackBarDefault(
          icon: AppIcon.error,
          title: KeyLanguage.alertFailedSave.tr,
          body: "${KeyLanguage.alertMessageFailedDownload.tr} $e",
        );
      }
      isClickSave = false;
      update([ConstantKey.idDownloadPdf]);
    }
  }
}
