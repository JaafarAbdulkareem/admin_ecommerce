import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/on_back_pressed.dart';
// import 'package:admin_ecommerce/core/function/on_back_pressed.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:admin_ecommerce/data/data_source/remote/auth/login_remote.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:admin_ecommerce/data/data_source/remote/auth/login_remote.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void goToForgetPassword();
  void loginOnTap();
  void changeStatePassword();
}

class LoginControllerImp extends LoginController {
  bool hidePassword = true;
  late GlobalKey<FormState> keyLogin;
  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  late LoginRemote loginRemote;
  late String titleDialog;
  late SharedPrefsService prefs;
  @override
  void onInit() {
    keyLogin = GlobalKey<FormState>();
    email = TextEditingController(text: "admin@gmail.com");
    password = TextEditingController(text: "654321");
    BackButtonInterceptor.add(onBackPressed);
    statusRequest = StatusRequest.initial;
    loginRemote = LoginRemote(curd: Get.find());
    titleDialog = KeyLanguage.alert.tr;
    prefs = Get.find<SharedPrefsService>();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  Future<void> sharedPreferencesInitial(response) async {
    await prefs.prefs
        .setString(ConstantKey.keyUserId, response[ApiColumnDb.id]);
    await prefs.prefs
        .setString(ConstantKey.keyEmail, response[ApiColumnDb.email]);
    await prefs.prefs.setString(
        ConstantKey.keyPassword, response[ApiColumnDb.password].toString());

    await prefs.prefs.setBool(ConstantKey.keyLogin, true);
//notification
    // String userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    // FirebaseMessaging.instance.subscribeToTopic(ConstantKey.usersTopics);
    // FirebaseMessaging.instance
    //     .subscribeToTopic("${ConstantKey.usersTopics}$userId");
  }

  @override
  void loginOnTap() async {
    if (keyLogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRemote.getData(
        email: email.text,
        password: password.text,
      );
      statusRequest = StatusRequest.initial;
      update();
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          statusRequest = StatusRequest.loading;
          update();
          await sharedPreferencesInitial(response[ApiResult.data]);
          await Get.offAllNamed(ConstantScreenName.home);
        } else {
          if (response[ApiResult.data] == ApiResult.noFound) {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.alertNoFound.tr,
            );
          } else if (response[ApiResult.data] == ApiResult.noApprove) {
            Get.toNamed(ConstantScreenName.verifyCode, arguments: {
              ApiKey.email: email.text,
              ApiKey.password: password.text,
              ApiKey.verifyCode: response[ApiResult.verifyCode],
            });
          } else {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.alertSomeError.tr,
            );
          }
          email.clear();
          password.clear();
        }
      } else {
        await Get.defaultDialog(
          title: titleDialog,
          middleText: KeyLanguage.alertSomeError.tr,
        );
      }
    }
  }

  @override
  void goToForgetPassword() async {
    if (email.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      await Get.toNamed(
        ConstantScreenName.forgetPassword,
        arguments: {
          ApiKey.email: email.text,
        },
      );
      statusRequest = StatusRequest.success;
      update();
    } else {
      await Get.defaultDialog(
        title: titleDialog,
        middleText: KeyLanguage.alertEnterEmail.tr,
      );
    }
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update([ConstantKey.idHintPassword]);
  }
}
