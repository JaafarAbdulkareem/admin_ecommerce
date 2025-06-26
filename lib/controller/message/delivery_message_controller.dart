import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/message/delivery_message_remote.dart';
import 'package:admin_ecommerce/data/models/report/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DeliveryMessageController extends GetxController {
  void sendMessage();
}

class DeliveryMessageControllerImp extends DeliveryMessageController {
  late GlobalKey<FormState> keyMessage;
  late StatusRequest statusRequest;
  late TextEditingController title;
  late TextEditingController body;
  late DeliveryMessageRemote _messageRemote;
  late AlertDefault _alertDefualt;
  @override
  void onInit() {
    keyMessage = GlobalKey<FormState>();
    statusRequest = StatusRequest.success;
    title = TextEditingController();
    body = TextEditingController();
    _messageRemote = DeliveryMessageRemote(curd: Get.find());
    _alertDefualt = AlertDefault();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  void sendMessage() async {
    if (keyMessage.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await _messageRemote.sendMessage(
        data: MessageModel(title: title.text, body: body.text),
      );
      statusRequest = handleStatus(response);

      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          title.clear();
          body.clear();
          statusRequest = StatusRequest.success;
          update();
          _alertDefualt.snackBarDefault(
            title: KeyLanguage.alertTitleSuccess.tr,
            body: KeyLanguage.alertMessageSuccessMessage.tr,
          );
        } else {
          _alertDefualt.snackBarDefault(
            body: KeyLanguage.alertMessageFailedMessage.tr,
          );
          Get.back();
        }
      } else {
        Get.back();
        _alertDefualt.snackBarDefault();
      }
    }
  }
}
