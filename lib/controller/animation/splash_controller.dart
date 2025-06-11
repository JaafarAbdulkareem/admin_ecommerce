import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  var opacity = 0.0.obs;
  late SharedPrefsService sharedPrefsService;

  @override
  void onInit() {
    super.onInit();
    sharedPrefsService = Get.find<SharedPrefsService>();

    // Start fade-in animation
    Future.delayed(const Duration(milliseconds: 300), () {
      opacity.value = 1.0;
    });

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      sharedPrefsService.prefs.setBool(ConstantKey.keySplash, true);
      Get.offAllNamed(ConstantScreenName.login);
    });
  }
}
