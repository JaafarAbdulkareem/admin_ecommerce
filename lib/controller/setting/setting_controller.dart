import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/localization/locale_controller.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  void changeStatePassword();
  void goToLoginDelivery();
  void goToDeliveryInfo();
  void logout();
}

class SettingControllerImp extends SettingController {
  late SharedPrefsService prefs;
  late String userId;
  late String email;
  late String password;
  late StatusRequest statusRequest;
  RxBool hidePassword = true.obs;

  late LocaleController localeController;
  late RxBool isDarkMode;
  late RxString currentLanguage;
  final items = const [
    DropdownMenuItem(value: ConstantLanguage.en, child: Text("English")),
    DropdownMenuItem(value: ConstantLanguage.ar, child: Text("العربية")),
  ];

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    email = prefs.prefs.getString(ConstantKey.keyEmail)!;
    password = prefs.prefs.getString(ConstantKey.keyPassword)!;

    statusRequest = StatusRequest.initial;

    localeController = Get.find();
    isDarkMode = (localeController.themeMode == ThemeMode.dark).obs;
    currentLanguage = localeController.language.languageCode.obs;
    super.onInit();
  }

  @override
  void changeStatePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void changeTheme(value) {
    isDarkMode.value = value;
    localeController.toggleTheme(value);
  }

  void changeLanguage(languageCode) {
    currentLanguage.value = languageCode;
    localeController.changeLanguage(languageCode);
  }

  @override
  void logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic(ConstantKey.adminsTopics);
    FirebaseMessaging.instance
        .unsubscribeFromTopic("${ConstantKey.adminsTopics}$userId");
    prefs.prefs.clear();
    Get.offAllNamed(ConstantScreenName.login);
  }

  @override
  void goToLoginDelivery() {
    Get.toNamed(ConstantScreenName.loginDelivery);
  }

  @override
  void goToDeliveryInfo() {
    Get.toNamed(ConstantScreenName.deliveryInfo);
  }
}
