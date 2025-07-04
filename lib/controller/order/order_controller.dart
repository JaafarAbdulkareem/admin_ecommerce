import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/order_remote.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  void goToDeliveryOrder();
  void goToReceiveOrder();
}

class OrderControllerImp extends OrderController {
  late StatusRequest statusRequest;
  late OrderRemote orderRemote;
  static List<OrderModel> orderData = [];
  static List<OrderModel> deliveryData = [];
  static List<OrderModel> receiveData = [];
  static bool firstTime = true;

  final AlertDefault alertDefualt = AlertDefault();

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    orderRemote = OrderRemote(curd: Get.find());
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    if (firstTime) {
      orderData.clear();
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await orderRemote.getData();
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          fetchData(response[ApiResult.data]);
          checkDataLength();
          filterOrderData();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        update();
      }
    } else {
      checkDataLength();
    }
  }

  fetchData(response) {
    for (var element in response) {
      orderData.add(OrderModel.fromJson(element));
    }
  }

  void checkDataLength() {
    if (orderData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  void filterOrderData() {
    deliveryData.clear();
    receiveData.clear();
    for (OrderModel element in orderData) {
      if (element.typeDelivery == ConstantScale.deliveryOption) {
        deliveryData.add(element);
      } else if (element.typeDelivery == ConstantScale.receiveOption) {
        receiveData.add(element);
      } else {
        alertDefualt.snackBarDefault();
        Get.back();
      }
    }
  }

  @override
  void goToDeliveryOrder() {
    Get.toNamed(
      ConstantScreenName.deliveryOrder,
    );
  }

  @override
  void goToReceiveOrder() {
    Get.toNamed(
      ConstantScreenName.receiveOrder,
    );
  }

  void refreshOrderAccepted({
    required String id,
    required String name,
    required String email,
    required String phone,
  }) {
    int index = deliveryData.indexWhere((e) => e.id == id);
    if (index != -1) {
      deliveryData[index].name = name;
      deliveryData[index].email = email;
      deliveryData[index].phone = phone;
      deliveryData[index].status = ConstantScale.acceptOption;
    }
  }

  void refreshOrderDone({
    required String id,
  }) {
    int index = deliveryData.indexWhere((e) => e.id == id);
    if (index != -1) {
      deliveryData[index].status = ConstantScale.doneDeliveryOption;
    }
  }
}
