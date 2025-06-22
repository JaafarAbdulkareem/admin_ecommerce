import 'package:admin_ecommerce/controller/base/base_type_order_controller.dart';
import 'package:admin_ecommerce/controller/order/order_controller.dart';
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
  void doneOrderButton({required String id, required String userId});
}

class DeliveryOrderControllerImp extends DeliveryOrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  late List<OrderModel> orderData;
  late List<OrderModel> penddingOrderData;
  late List<OrderModel> prepareOrderData;
  late List<OrderModel> acceptOrderData;
  late List<OrderModel> onWayOrderData;
  late List<OrderModel> doneOrderData;
  late List<List<OrderModel>> data;
  late DeliveryOrderRemote deliveryOrderRemote;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    orderData = OrderControllerImp.deliveryData;
    // orderData = Get.arguments[ConstantKey.deliveryData];
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
    var response = await deliveryOrderRemote.prepareOrder(
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
    update([ConstantKey.idAccepted + id]);
    var response = await deliveryOrderRemote.onTheWayOrder(
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
        update([ConstantKey.idAccepted + id]);
        if (prepareOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idAccepted]);
        } else {
          update([ConstantKey.idAccepted]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idAccepted]);
      }
    } else {
      alertDefualt.snackBarDefault();

      update();
    }
  }

  @override
  void doneOrderButton({
    required String id,
    required String userId,
  }) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idOnTheWayButton + id]);
    var response = await deliveryOrderRemote.doneOrder(
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
        update([ConstantKey.idOnTheWayButton + id]);
        if (onWayOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idOnTheWayButton]);
        } else {
          update([ConstantKey.idOnTheWayButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idOnTheWayButton]);
      }
    } else {
      alertDefualt.snackBarDefault();
      update();
    }
  }

  refreshAccepted({
    required String id,
    required String name,
    required String email,
    required String phone,
  }) {
    int index = orderData.indexWhere((e) => e.id == id);
    print("index : $index");
    if (index != -1) {
      orderData[index].name = name;
      orderData[index].email = email;
      orderData[index].phone = phone;
      orderData[index].status = ConstantScale.acceptOption;
      filterDeliveryStatusOrder();
    }
    update([ConstantKey.idPrepareButton]);
  }

  // refreshDone(){}
}
