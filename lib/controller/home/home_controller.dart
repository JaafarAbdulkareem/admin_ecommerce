import 'package:admin_ecommerce/core/function/on_back_pressed.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  // late SharedPrefsService sharedPrefsService;
  // late String username;
  // late int indexBar;
  // late StatusRequest statusRequest;

  @override
  void onInit() {
    BackButtonInterceptor.add(onBackPressed);
    // sharedPrefsService = Get.find<SharedPrefsService>();
    // username = sharedPrefsService.prefs.getString(ConstantKey.keyUsername)??"";
    // // indexBar = ConstantScale.defalutIndexView;
    // statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }
}
