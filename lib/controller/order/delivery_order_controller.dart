import 'package:admin_ecommerce/controller/base/base_type_order_controller.dart';
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/delivery_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class DeliveryOrderController extends BaseTypeOrderController {
  void prepareButton({required String id, required String userId});
  void onthWayButton({required String id, required String userId});
  void deliveryButton({required String id, required String userId});
  // void onCall();
}

class DeliveryOrderControllerImp extends DeliveryOrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  late List<OrderModel> orderData;
  late List<OrderModel> penddingOrderData;
  late List<OrderModel> prepareOrderData;
  late List<OrderModel> onWayOrderData;
  late List<OrderModel> acceptOrderData;
  late List<OrderModel> doneOrderData;
  late List<List<OrderModel>> data;
  late DeliveryOrderRemote deliveryOrderRemote;

  final AlertDefault alertDefualt = AlertDefault();

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    orderData = Get.arguments[ConstantKey.deliveryData];
    filterDeliveryStatusOrder();

    deliveryOrderRemote = DeliveryOrderRemote(curd: Get.find());
    super.onInit();
  }

  void filterDeliveryStatusOrder() {
    penddingOrderData = [];
    prepareOrderData = [];
    acceptOrderData = [];
    onWayOrderData = [];
    doneOrderData = [];

    for (OrderModel order in orderData) {
      switch (order.status) {
        case ConstantScale.pendingOption:
          penddingOrderData.add(order);
          break;
        case ConstantScale.prepareOption:
          prepareOrderData.add(order);
          break;
        case ConstantScale.acceptOption:
          acceptOrderData.add(order);
          break;
        case ConstantScale.onWayOption:
          onWayOrderData.add(order);
          break;
        case ConstantScale.doneDeliveryOption:
          doneOrderData.add(order);
          break;
        // default:
        //   // Optional: handle unknown statuses
        //   break;
      }
    }

    data = [
      penddingOrderData,
      prepareOrderData,
      acceptOrderData,
      onWayOrderData,
      doneOrderData,
    ];
  }

  @override
  void changeBottonBar(int currentnIdex) {
    barIndex = currentnIdex;
    if (data[barIndex].isEmpty) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void prepareButton({
    required String id,
    required String userId,
  }) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idPendingButton + id]);
    var response = await deliveryOrderRemote.pendingOrder(
      id: id,
      userId: userId,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        int index = orderData.indexWhere((e) => e.id == id);
        if (index != -1) {
          orderData[index].status = ConstantScale.prepareOption;
          filterDeliveryStatusOrder();
        }
        statusRequest = StatusRequest.success;
        update([ConstantKey.idPendingButton + id]);
        if (penddingOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idPendingButton]);
        } else {
          update([ConstantKey.idPendingButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idPendingButton]);
      }
    } else {
      alertDefualt.snackBarDefault();

      update();
    }
  }

  @override
  void onthWayButton({
    required String id,
    required String userId,
  }) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idPrepareButton + id]);
    var response = await deliveryOrderRemote.prepareOrder(
      id: id,
      userId: userId,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        int index = orderData.indexWhere((e) => e.id == id);
        if (index != -1) {
          orderData[index].status = ConstantScale.onWayOption;
          filterDeliveryStatusOrder();
        }
        statusRequest = StatusRequest.success;
        update([ConstantKey.idPrepareButton + id]);
        if (prepareOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idPrepareButton]);
        } else {
          update([ConstantKey.idPrepareButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idPrepareButton]);
      }
    } else {
      alertDefualt.snackBarDefault();

      update();
    }
  }

  refreshAccepted({
    required String name,
    required String phone,
  }) // will delivery man make accept and give notification
  {
    update([ConstantKey.idAccepted]);
  }

  @override
  void deliveryButton({
    required String id,
    required String userId,
  }) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idDeliveryButton + id]);
    var response = await deliveryOrderRemote.deliveryOrder(
      id: id,
      userId: userId,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        int index = orderData.indexWhere((e) => e.id == id);
        if (index != -1) {
          orderData[index].status = ConstantScale.doneDeliveryOption;
          filterDeliveryStatusOrder();
        }
        statusRequest = StatusRequest.success;
        update([ConstantKey.idDeliveryButton + id]);
        if (onWayOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idDeliveryButton]);
        } else {
          update([ConstantKey.idDeliveryButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idDeliveryButton]);
      }
    } else {
      alertDefualt.snackBarDefault();
      update();
    }
  }

  // Future<void> requestPermissions() async {
  //   await Permission.camera.request();
  //   await Permission.phone.request();
  // }

  // Future<void> onCall() async {
  //   var status = await Permission.phone.status;

  //   if (status.isGranted) {
  //     final Uri phoneUri = Uri.parse("tel:+1-555-010-999");
  //     final bool launched = await launchUrl(phoneUri);
  //     print(launched ? "✅ Launch success" : "❌ Launch failed");
  //   } else if (status.isDenied) {
  //     Get.defaultDialog(
  //       title: "Permission Permanently Denied",
  //       titleStyle: Get.theme.textTheme.titleLarge?.copyWith(
  //         color: AppColor.primary,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       middleText:
  //           "Phone permission is permanently denied. Please enable it from app settings.",
  //       middleTextStyle: Get.theme.textTheme.bodyMedium?.copyWith(
  //         color: AppColorText.primary,
  //       ),
  //       backgroundColor: AppColor.card,
  //       radius: 12,
  //       textConfirm: "Open Settings",
  //       confirmTextColor: Colors.white,
  //       buttonColor: AppColor.primary,
  //       textCancel: "Cancel",
  //       cancelTextColor: AppColorText.textButton,
  //       onConfirm: () {
  //         openAppSettings();
  //         Get.back();
  //       },
  //     );
  //     // 🔁 Ask again with a dialog
  //     Get.defaultDialog(
  //       title: "Phone Permission Required",
  //       middleText:
  //           "This app needs phone access to make calls.\nWould you like to allow it?",
  //       textConfirm: "Allow",
  //       textCancel: "Cancel",
  //       onConfirm: () async {
  //         Get.back();
  //         var newStatus = await Permission.phone.request();
  //         if (newStatus.isGranted) {
  //           onCall(); // retry after permission granted
  //         } else {
  //           print("❌ Still not granted after prompt.");
  //         }
  //       },
  //     );
  //   } else if (status.isPermanentlyDenied) {
  //     // 🚫 Can't ask again — user must open settings
  //     Get.defaultDialog(
  //       title: "Permission Permanently Denied",
  //       titleStyle: Get.theme.textTheme.titleLarge?.copyWith(
  //         color: AppColor.primary,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       middleText:
  //           "Phone permission is permanently denied. Please enable it from app settings.",
  //       middleTextStyle: Get.theme.textTheme.bodyMedium?.copyWith(
  //         color: AppColorText.textButton,
  //       ),
  //       backgroundColor: AppColor.card,
  //       radius: 12,
  //       textConfirm: "Open Settings",
  //       confirmTextColor: Colors.white,
  //       buttonColor: AppColor.primary,
  //       textCancel: "Cancel",
  //       cancelTextColor: AppColorText.textButton,
  //       onConfirm: () {
  //         openAppSettings();
  //         Get.back();
  //       },
  //     );

  //     // Get.defaultDialog(
  //     //   title: "Permission Permanently Denied",
  //     //   middleText:
  //     //       "Phone permission is permanently denied. Please enable it from app settings.",
  //     //   textConfirm: "Open Settings",
  //     //   textCancel: "Cancel",
  //     //   onConfirm: () {
  //     //     openAppSettings();
  //     //     Get.back();
  //     //   },
  //     // );
  //   } else {
  //     print("📛 Unknown phone permission state: $status");
  //   }

  //   //   // statusRequest = StatusRequest.loading;
  //   //   // update();
  //   //  var x = await launchUrl(Uri.parse("tel:+1-555-010-999")).then((_) {
  //   //   print("success");
  //   //     // statusRequest = StatusRequest.success;
  //   //     // update([calledButton]);
  //   //   }).catchError((error) {
  //   //   print("failure");
  //   //     // statusRequest = StatusRequest.failure;
  //   //     // update();
  //   //   });
  //   //   print("x = $x");
  // }

  // void openAppSettingsDialog() {
  //   Get.defaultDialog(
  //     title: "Permission Required",
  //     middleText:
  //         "Phone permission is required to make a call.\nPlease enable it in settings.",
  //     textConfirm: "Open Settings",
  //     textCancel: "Cancel",
  //     onConfirm: () {
  //       openAppSettings();
  //       Get.back();
  //     },
  //   );
  // }
}
