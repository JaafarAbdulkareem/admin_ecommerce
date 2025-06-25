import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
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
  final keyPage1 = GlobalKey(); // Grid + Line Chart
  final keyPage2 = GlobalKey(); // Bar + Pie Chart

  final gridData = <ItemReportModel>[
    ItemReportModel(title: 'Users Using App', count: 1200, color: Colors.blue),
    ItemReportModel(title: 'Deliveries', count: 850, color: Colors.green),
    ItemReportModel(
        title: 'Total Products', count: 56000, color: Colors.orange),
    ItemReportModel(title: 'Inactive Products', count: 300, color: Colors.red),
    ItemReportModel(title: 'Orders', count: 240000, color: Colors.purple),
  ].obs;

  final monthlySeries = <FlSpot>[
    FlSpot(1, 100),
    FlSpot(2, 800),
    FlSpot(3, 500),
    FlSpot(4, 700),
  ].obs;

  final cityData = <String, double>{
    'Bengaluru': 1500,
    'Mumbai': 1200,
    'Delhi': 900,
    'Chennai': 700,
  }.obs;

  final categoryData = <String, double>{
    'Electronics': 1800,
    'Fashion': 2400,
    'Home': 1200,
    'Books': 600,
    'Extra1': 800,
    'Extra2': 750,
    'Extra3': 620,
    'Extra4': 410,
  }.obs;

  final AlertDefault _alert = AlertDefault();
  bool isClickSave = false;

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
