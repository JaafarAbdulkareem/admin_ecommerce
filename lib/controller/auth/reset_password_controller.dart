import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/auth/reset_password_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void saveOnTap();
  void changeStatePassword();
  void changeStateRepassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  bool hidePassword = true;
  bool hideRepassword = true;
  late GlobalKey<FormState> keyResetPassword;
  late TextEditingController password;
  late TextEditingController rePassword;
  late StatusRequest statusRequest;
  late String email;
  late ResetPasswordRemote resetPasswordRemote;
  late String titleDialog;
  @override
  void onInit() {
    keyResetPassword = GlobalKey<FormState>();
    password = TextEditingController();
    rePassword = TextEditingController();
    statusRequest = StatusRequest.initial;
    email = Get.arguments[ApiKey.email];
    resetPasswordRemote = ResetPasswordRemote(curd: Get.find());
    titleDialog = KeyLanguage.alert.tr;
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  void saveOnTap() async {
    if (keyResetPassword.currentState!.validate()) {
      if (password.text == rePassword.text) {
        var response = await resetPasswordRemote.getData(
          email: email,
          password: password.text,
        );
        statusRequest = handleStatus(response);
        update();
        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            statusRequest = StatusRequest.loading;
            update();
            Get.back();
            // await Get.offAllNamed(ConstantScreenName.login);
          } else if (response[ApiResult.data] == ApiResult.noFound) {
            password.clear();
            rePassword.clear();
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.alertNoFound.tr,
            );
          } else {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.alertSomeError.tr,
            );
          }
        }
      } else {
        await Get.defaultDialog(
          title: titleDialog,
          middleText: KeyLanguage.passwordMismatchMassage.tr,
        );
      }
    }
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }

  @override
  void changeStateRepassword() {
    hideRepassword = !hideRepassword;
    update();
  }
}
