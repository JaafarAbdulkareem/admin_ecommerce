import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/setting/setting_remote.dart';
import 'package:admin_ecommerce/data/models/setting/insert_delivery_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupDeliveryController extends GetxController {
  void changeStatePassword();
}

class SignupDeliveryControllerImp extends SignupDeliveryController {
  late StatusRequest statusRequest;
  RxBool hidePassword = true.obs;
  late GlobalKey<FormState> keySignup;
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late SettingRemote _settingRemote;
  final AlertDefault _alertDefault = AlertDefault();
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    keySignup = GlobalKey<FormState>();
    username = TextEditingController();
    age = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    _settingRemote = SettingRemote(curd: Get.find());
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    age.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  void signupOnTap() async {
    if (keySignup.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await _settingRemote.signupDelivery(
        data: InsertDeliveryInfoModel(
          username: username.text,
          age: age.text,
          email: email.text,
          password: password.text,
          phone: phone.text,
        ),
      );
      statusRequest = handleStatus(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          await FirebaseFirestore.instance
              .collection(ConstantKey.collectionDeliveryStatus)
              .doc(response[ApiResult.data])
              .set({ApiColumnDb.active: false});
              
          username.clear();
          phone.clear();
          age.clear();
          email.clear();
          password.clear();
          statusRequest = StatusRequest.success;
          update();
          _alertDefault.snackBarDefault(
            title: KeyLanguage.alertTitleSuccess.tr,
            body: KeyLanguage.alertDeliveryRegisterSuccess.tr,
          );
        } else {
          _alertDefault.dialogDefault(
            body: KeyLanguage.alerMessageEmailFound.tr,
          );
        }
      } else {
        username.clear();
        phone.clear();
        age.clear();
        email.clear();
        password.clear();
        Get.back();
        _alertDefault.snackBarDefault();
      }
    }
  }

  @override
  void changeStatePassword() {
    hidePassword.value = !hidePassword.value;
  }
}
