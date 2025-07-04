import 'dart:async';

import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/dialog_want_delete.dart';
import 'package:admin_ecommerce/core/function/email_send.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/on_call.dart';
import 'package:admin_ecommerce/data/data_source/remote/setting/setting_remote.dart';
import 'package:admin_ecommerce/data/models/setting/delivery_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class DelivreyMenInfoController extends GetxController {
  void onCall(String phone);
  void onEmail(String email);
  void deleteDeliveryMan(int index);
}

class DelivreyMenInfoControllerImp extends DelivreyMenInfoController {
  late StatusRequest statusRequest;
  late SettingRemote _settingRemote;
  static List<DeliveryInfoModel> deliveryMenData = [];
  static bool firstTime = true;
  final AlertDefault _alertDefault = AlertDefault();

  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _activeDeliverySubscription;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    _settingRemote = SettingRemote(curd: Get.find());
    _getData();
    super.onInit();
  }

  @override
  void dispose() {
    _activeDeliverySubscription?.cancel();
    _activeDeliverySubscription = null;
    super.dispose();
  }

  void fetchData(response) {
    for (var element in response) {
      deliveryMenData.add(DeliveryInfoModel.fromJson(element));
    }
  }

  void _getData() async {
    if (firstTime) {
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await _settingRemote.getDeliveryData();
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          fetchData(response[ApiResult.data]);
          _liveActiveDelivery();
          checkDataLength();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        firstTime = true;
        update();
      }
    } else {
      checkDataLength();
    }
  }

  void checkDataLength() {
    if (deliveryMenData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  void onCall(String phone) {
    onPhoneCall(phone);
  }

  @override
  void onEmail(String email) {
    onEmailSend(email);
  }

  @override
  void deleteDeliveryMan(int index) {
    dialogWantDelete(
      yesButton: () async {
        statusRequest = StatusRequest.loading;
        update();
        var response = await _settingRemote.deleteDelivery(
          id: deliveryMenData[index].id,
        );
        statusRequest = handleStatus(response);
        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            deliveryMenData.removeAt(index);
            if (deliveryMenData.isEmpty) {
              statusRequest = StatusRequest.failure;
              update();
            } else {
              statusRequest = StatusRequest.success;
              update();
            }
          } else {
            statusRequest = StatusRequest.success;
            update();
            _alertDefault.snackBarDefault();
          }
        } else {
          update();
        }
        Get.back();
      },
    );
  }

  void _liveActiveDelivery() {
    for (int i = 0; i < deliveryMenData.length; i++) {
      _activeDeliverySubscription = FirebaseFirestore.instance
          .collection(ConstantKey.collectionDeliveryStatus)
          .doc(deliveryMenData[i].id)
          .snapshots()
          .listen((event) {
        if (event.exists) {
          final newValue = event.get(ApiColumnDb.active);
          deliveryMenData[i].active.value = newValue; // ✅ update observable
        }
      });
    }
  }
}
