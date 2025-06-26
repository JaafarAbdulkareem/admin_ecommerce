import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class MessageController extends GetxController {
  void goToUsersMessage();
  void goToDeliveryMessage();
}

class MessageControllerImp extends MessageController {
  late StatusRequest statusRequest;
  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  void goToUsersMessage() {
    Get.toNamed(ConstantScreenName.usersMessage);
  }

  @override
  void goToDeliveryMessage() {
    Get.toNamed(ConstantScreenName.deliveryMessage);
  }
}
