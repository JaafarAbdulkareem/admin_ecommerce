import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  void goToReceiveMessage();
}

class NotificationControllerImp extends NotificationController {
  late StatusRequest statusRequest;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  void goToReceiveMessage() {
    Get.toNamed(ConstantScreenName.receiveNotification);
  }
}
