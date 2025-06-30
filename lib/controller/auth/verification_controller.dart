import 'package:admin_ecommerce/controller/auth/forget_password_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:admin_ecommerce/data/data_source/remote/auth/verification_remote.dart';
import 'package:get/get.dart';

abstract class VerificationController extends GetxController {
  void verificationOnTap({required String verifyCode});
}

class VerificationControllerImp extends VerificationController {
  late SharedPrefsService prefs;
  late StatusRequest statusRequest;
  late VerifictionRemote verifictionRemote;
  late String verifyCode;
  late String email;

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    statusRequest = StatusRequest.initial;
    verifictionRemote = VerifictionRemote(curd: Get.find());
    verifyCode = Get.arguments[ApiKey.verifyCode].toString();
    email = Get.arguments[ApiKey.email].toString();
    super.onInit();
  }

  void goToResetPassword({required String verifyCode}) async {
    var response = await verifictionRemote.getData(
      email: email,
      verifyCode: verifyCode,
    );
    print("res : $response");
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();
        await Get.offNamedUntil(
          ConstantScreenName.resetPassword,
          (route) => route.settings.name == ConstantScreenName.login,
          arguments: {
            ApiKey.email: email,
          },
        );
        // await Get.offNamed(
        //   ConstantScreenName.resetPassword,
        //   arguments: {
        //     ApiKey.email: email,
        //   },
        // );
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.alertVerifyWrong.tr,
        );
      }
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.alertSomeError.tr,
      );
    }
  }

  void goToHome({required String verifyCode}) async {
    var response = await verifictionRemote.getData(
      email: email,
      verifyCode: verifyCode,
    );
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();
        await Get.offAllNamed(ConstantScreenName.home);
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.alertVerifyWrong.tr,
        );
      }
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.alertSomeError.tr,
      );
    }
  }

  @override
  void verificationOnTap({required String verifyCode}) async {
    print("regitoer : ${Get.isRegistered<ForgetPasswordControllerImp>()}");
    if (Get.isRegistered<ForgetPasswordControllerImp>()) {
      goToResetPassword(verifyCode: verifyCode);
    } else {
      await prefs.prefs.setBool(ConstantKey.keyLogin, true);
      goToHome(verifyCode: verifyCode);
    }
  }
}
