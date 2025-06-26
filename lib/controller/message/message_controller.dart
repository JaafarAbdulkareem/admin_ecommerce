import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class MessageController extends GetxController {
  void goToUsersMessage();
}

class MessageControllerImp extends MessageController {
  late StatusRequest statusRequest;
  @override
  void onInit() {
    //****initial status */
    statusRequest = StatusRequest.success;
    super.onInit();
  }
  
  @override
  void goToUsersMessage() {
    Get.toNamed(ConstantScreenName.usersMessage);
  }
}
