import 'package:admin_ecommerce/core/class/custom_google_map.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/detail_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/detail_order/detail_order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DetailOrderController extends GetxController {}

class DetailOrderControllerImp extends DetailOrderController {
  late DetailOrderRemote detailOrderRemote;
  late String orderId, userId;
  late StatusRequest statusRequest;
  late DetailOrderModel detailOrderData;
  static DetailOrderModel? lastdetailOrderData;
  late LatLng latLngStore;
  late CameraPosition initialCameraPosition;

  late GoogleMapController googleMapController;
  late CustomGoogleMap customGoogleMap;
  @override
  void onInit() {
    detailOrderRemote = DetailOrderRemote(curd: Get.find());
    orderId = Get.arguments[ApiKey.id];
    userId = Get.arguments[ApiKey.userId];
    statusRequest = StatusRequest.initial;
    latLngStore = const LatLng(
      ConstantScale.latitudeStore,
      ConstantScale.longitudeStore,
    );
    initialCameraPosition = CameraPosition(
      target: latLngStore,
      zoom: 2,
    );
    initialGetData();
    customGoogleMap = CustomGoogleMap(refresh: () {
      googleMapController.animateCamera(
          CameraUpdate.newLatLngBounds(customGoogleMap.bounds!, 16));
      update([ConstantKey.idGoogleMap]);
    });
    // locationService = LocationService();
    // uuid = const Uuid();

    super.onInit();
  }

  void initialGetData() {
    if (lastdetailOrderData != null && lastdetailOrderData?.id == orderId) {
      detailOrderData = lastdetailOrderData!;
      statusRequest = StatusRequest.success;
      update();
    } else {
      getData();
    }
  }

  @override
  void dispose() {
    googleMapController.dispose();
    customGoogleMap.dispose();
    super.dispose();
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailOrderRemote.getDetailOrder(
      id: orderId,
      userId: userId,
    );

    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        detailOrderData = DetailOrderModel.fromJson(response[ApiResult.data]);
        lastdetailOrderData = detailOrderData;
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.alertAddressLoading.tr,
        backgroundColor: AppColor.snackbar,
      );
    }
  }

  void onMapCreated(controller) async {
    googleMapController = controller;
    customGoogleMap.mapCameraPosition(
      detailOrderData: detailOrderData,
    );
  }
}
