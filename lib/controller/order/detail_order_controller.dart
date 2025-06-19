import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/service/location_service.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/detail_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/detail_order/detail_order_model.dart';
// import 'package:admin_ecommerce/view/widget/order/show_rating_dialogs_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DetailOrderController extends GetxController {
  // void getProductRating({
  //   required BuildContext context,
  //   required int index,
  // });
  // void changeRatingValue(int index);
}

class DetailOrderControllerImp extends DetailOrderController {
  late DetailOrderRemote detailOrderRemote;
  late String orderId, userId;
  late StatusRequest statusRequest;
  late DetailOrderModel detailOrderData;
  static DetailOrderModel? lastdetailOrderData;
  Set<Marker> markers = {};
  // // Set<Polyline> polylines = {};
  late CameraPosition initialCameraPosition;
  // late GoogleMapController googleMapController;
  // late LocationService locationService;
  // late Uuid uuid;
  @override
  void onInit() {
    detailOrderRemote = DetailOrderRemote(curd: Get.find());
    orderId = Get.arguments[ApiKey.id];
    userId = Get.arguments[ApiKey.userId];
    statusRequest = StatusRequest.initial;
    initialCameraPosition = const CameraPosition(
      target: LatLng(0, 0),
      zoom: 2,
    );
    initialGetData();
    // locationService = LocationService();
    // uuid = const Uuid();

    super.onInit();
  }

  void initialGetData() {
    print("getData functoin : ${lastdetailOrderData}");

    if (lastdetailOrderData != null && lastdetailOrderData?.id == orderId) {
      detailOrderData = lastdetailOrderData!;
      print("getData functoin 2 : $detailOrderData");
      statusRequest = StatusRequest.success;
      update();
    } else {
      print("getData functoin 3 : ");
      getData();
    }
  }

  @override
  void dispose() {
    // googleMapController.dispose();
    // locationService.cancelLocationSubscription();

    super.dispose();
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailOrderRemote.getDetailOrder(
      id: orderId,
      userId: userId,
    );

    print("response : $response");
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        detailOrderData = DetailOrderModel.fromJson(response[ApiResult.data]);
        lastdetailOrderData = detailOrderData;
        mapCameraPosition();

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

  void mapCameraPosition() {
    if (detailOrderData.addressId != null) {
      LatLng latLng = LatLng(detailOrderData.address!.latitude,
          detailOrderData.address!.longitude);
      markers.add(
        Marker(
          markerId: const MarkerId(ConstantKey.idUserLocation),
          position: latLng,
        ),
      );
      initialCameraPosition = CameraPosition(
        target: latLng,
        zoom: 14,
      );
    }
  }

  // @override
  // void getProductRating({
  //   required BuildContext context,
  //   required int index,
  // }) async {
  //   await showRatingDialogProduct(
  //     context: context,
  //     index: index,
  //     image: detailOrderData.productsData[index].image,
  //     productId: detailOrderData.productsData[index].productId.toString(),
  //     orderId: orderId,
  //   );
  //   update([ConstantKey.idRatingButton]);
  // }

  // @override
  // void changeRatingValue(int index) {
  //   if (lastdetailOrderData != null) {
  //     detailOrderData = lastdetailOrderData!;
  //     detailOrderData.productsData[index].rating = true;
  //   }
  // }

  // // void onMapCreated(controller) async {
  // //   googleMapController = controller;
  // //   await locationService.getRealTimeLocationData((locationData) {
  // //     final currentLatLng = LatLng(
  // //       locationData.latitude!,
  // //       locationData.longitude!,
  // //     );

  // //     // Update the same marker (by ID) to avoid duplication
  // //     // markers.removeWhere(
  // //     //     (marker) => marker.markerId.value == ConstantKey.idUserLocation);
  // // markers.add(
  // //   Marker(
  // //     markerId: const MarkerId(ConstantKey.idUserLocation),
  // //     position: currentLatLng,
  // //   ),
  // // );
  // //     // markers.refresh();

  // //     googleMapController.animateCamera(
  // //       CameraUpdate.newLatLng(currentLatLng),
  // //     );
  // //     update([ConstantKey.idGoogleMap]);
  // //   });
  // // }
}
