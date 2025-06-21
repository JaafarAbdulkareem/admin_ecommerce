import 'package:admin_ecommerce/controller/base/base_type_order_controller.dart';
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/receive_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class ReceiveOrderController extends BaseTypeOrderController {
  void pickedupButton({required String id, required String userId});
  List<OrderModel>? searchOrders(String searchText);
}

class ReceiveOrderControllerImp extends ReceiveOrderController {
  late StatusRequest statusRequest;
  late ReceiveOrderRemote receiveOrder;
  late int barIndex;
  late List<OrderModel> orderData;
  late List<OrderModel> receiveData;
  late List<OrderModel> archiveData;
  late List<List<OrderModel>> data;
  // static bool  = true;
  final AlertDefault alertDefualt = AlertDefault();

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    receiveOrder = ReceiveOrderRemote(curd: Get.find());
    barIndex = ConstantScale.initiBarIndex;

    orderData = Get.arguments[ConstantKey.receiveData];
    receiveData = [];
    archiveData = [];
    filterDeliveryStatusOrder();
    data = [receiveData, archiveData];
    super.onInit();
  }

  filterDeliveryStatusOrder() {
    receiveData = [];
    archiveData = [];

    for (OrderModel element in orderData) {
      if (element.status == ConstantScale.pendingPickUpOption) {
        receiveData.add(element);
      } else if (element.status == ConstantScale.doneDeliveryOption) {
        archiveData.add(element);
      }
    }

    print("receiveData: ${receiveData.length}, "
        "archiveData: ${archiveData.length}, ");
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
  void pickedupButton({
    required String id,
    required String userId,
  }) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idPickUpButton + id]);
    var response = await receiveOrder.receiveOrder(
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
        statusRequest = StatusRequest.success;
        update([ConstantKey.idPickUpButton + id]);
        if (receiveData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idPickUpButton]);
        } else {
          update([ConstantKey.idPickUpButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idPickUpButton]);
      }
    } else {
      alertDefualt.snackBarDefault();

      update();
    }
  }

  @override
  List<OrderModel>? searchOrders(String searchText) {
    if (searchText.trim().isNotEmpty) {
      final lowerSearch = searchText.toLowerCase();

      return receiveData.where((order) {
        return order.id.toLowerCase().contains(lowerSearch);
        // ||
        // order.userId.toLowerCase().contains(lowerSearch) ||
        // (order.addressId?.toLowerCase().contains(lowerSearch) ?? false) ||
        // (order.couponsId?.toLowerCase().contains(lowerSearch) ?? false) ||
        // order.price.toString().contains(lowerSearch) ||
        // order.totalPrice.toString().contains(lowerSearch) ||
        // order.deliveryPrice.toString().contains(lowerSearch);
        // //  ||
        // order.status.toString().contains(lowerSearch);
      }).toList();
    }
    return null;
  }
}
