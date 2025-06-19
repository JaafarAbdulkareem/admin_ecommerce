import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {}

class NotificationControllerImp extends NotificationController {
  late StatusRequest statusRequest;
  @override
  void onInit() {
    //****initial status */
    statusRequest = StatusRequest.success;
    super.onInit();
  }
}
