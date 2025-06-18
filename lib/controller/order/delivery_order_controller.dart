import 'package:admin_ecommerce/controller/base/base_type_order_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/delivery_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class DeliveryOrderController extends BaseTypeOrderController {
  // void changeBottonBar(int currentnIdex);
  void prepareButton({required String id, required String userId});
  void onthWayButton({required String id, required String userId});
  void deliveryButton({required String id, required String userId});
}

class DeliveryOrderControllerImp extends DeliveryOrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  late List<OrderModel> orderData;
  late List<OrderModel> penddingOrderData;
  late List<OrderModel> prepareOrderData;
  late List<OrderModel> onWayOrderData;
  late List<OrderModel> doneOrderData;
  late List<List<OrderModel>> data;
  late DeliveryOrderRemote deliveryOrderRemote;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    orderData = Get.arguments[ConstantKey.deliveryData];
    filterDeliveryStatusOrder();
    data = [penddingOrderData, prepareOrderData, onWayOrderData, doneOrderData];
    deliveryOrderRemote = DeliveryOrderRemote(curd: Get.find());
    super.onInit();
  }

  filterDeliveryStatusOrder() {
    penddingOrderData = [];
    prepareOrderData = [];
    onWayOrderData = [];
    doneOrderData = [];
    for (OrderModel element in orderData) {
      if (element.status == ConstantScale.pendingOption) {
        penddingOrderData.add(element);
      } else if (element.status == ConstantScale.prepareOption) {
        prepareOrderData.add(element);
      } else if (element.status == ConstantScale.onWayOption) {
        onWayOrderData.add(element);
      } else if (element.status == ConstantScale.doneDeliveryOption) {
        doneOrderData.add(element);
      }
    }
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
    update([ConstantKey.idPenddingButton + id]);
    var response = await deliveryOrderRemote.pendingOrder(
      id: id,
      userId: userId,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        int index = orderData.indexWhere((e) => e.id == id);
        if (index != -1) {
          orderData[index].status = ConstantScale.onWayOption;
        }
        filterDeliveryStatusOrder();
        // prepareOrderData.add(penddingOrderData.firstWhere((e) => e.id == id));
        // penddingOrderData.removeWhere((e) => e.id == id);
        statusRequest = StatusRequest.success;
        update([ConstantKey.idPenddingButton + id]);
        if (penddingOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idPenddingButton]);
        } else {
          update([ConstantKey.idPenddingButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idPenddingButton]);
      }
    } else {
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.alertSomeError.tr,
        backgroundColor: AppColor.snackbar,
      );
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
        }
        filterDeliveryStatusOrder();
        // onWayOrderData.add(prepareOrderData.firstWhere((e) => e.id == id));
        // prepareOrderData.removeWhere((e) => e.id == id);
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
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.alertSomeError.tr,
        backgroundColor: AppColor.snackbar,
      );
      update();
    }
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
        }
        filterDeliveryStatusOrder();
        // doneOrderData.add(onWayOrderData.firstWhere((e) => e.id == id));
        // onWayOrderData.removeWhere((e) => e.id == id);
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
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.alertSomeError.tr,
        backgroundColor: AppColor.snackbar,
      );
      update();
    }
  }
}
