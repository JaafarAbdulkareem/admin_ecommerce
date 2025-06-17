import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  void changeBottonBar(int currentnIdex);
}

class OrderControllerImp extends OrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  static List<OrderModel> orderData = [
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200,status: 0, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
    OrderModel(id: 1, typePayment:0, typeDelivery: 0, deliveryPrice: 100, price: 100, totalPrice: 200, userId: 2),
  ];
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    super.onInit();
  }

  @override
  void changeBottonBar(int currentnIdex) {
    barIndex = currentnIdex;
    update();
  }
}
