import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {}

class OrederControllerImp extends OrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    super.onInit();
  }
}
