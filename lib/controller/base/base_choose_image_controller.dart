import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:get/get.dart';

abstract class BaseChooseImageController extends GetxController {
  late StatusRequest statusRequest;
  void chooseImageButton();
}
