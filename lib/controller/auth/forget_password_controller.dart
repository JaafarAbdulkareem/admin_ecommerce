import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/auth/forget_password_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkOnTap();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late GlobalKey<FormState> keyForgetPassword;
  late TextEditingController email;
  late StatusRequest statusRequest;
  late ForgetPasswordRemote forgetPasswordRemote;
  @override
  void onInit() {
    keyForgetPassword = GlobalKey<FormState>();
    email = TextEditingController(text: Get.arguments[ApiKey.email]);
    statusRequest = StatusRequest.initial;
    forgetPasswordRemote = ForgetPasswordRemote(curd: Get.find());
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  void checkOnTap() async {
    if (keyForgetPassword.currentState!.validate()) {
      var response = await forgetPasswordRemote.getData(
        email: email.text,
      );
      statusRequest = handleStatus(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          statusRequest = StatusRequest.loading;
          update();
          await Get.toNamed(
            ConstantScreenName.verifyCode,
            arguments: {
              ApiKey.email: email.text,
              ApiKey.verifyCode: response[ApiResult.data],
            },
          );
        } else {
          email.clear();
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.alertNoFound.tr,
          );
        }
        statusRequest = StatusRequest.success;
        update();
      } 
    }
  }
}
