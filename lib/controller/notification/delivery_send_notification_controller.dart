import 'package:admin_ecommerce/controller/base/base_notification_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:admin_ecommerce/data/models/notification_model.dart';
import 'package:get/get.dart';

abstract class DeliverySendNotificationController
    extends BaseNotificationController {}

class DeliverySendNotificationControllerImp
    extends DeliverySendNotificationController {
  late SharedPrefsService prefs;
  late String userId;
  static List<NotificationModel> notificationData = [];
  static bool firstTime = true;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    _getData();
    super.onInit();
  }

  void fetchData(response) {
    for (var element in response) {
      notificationData.add(NotificationModel.fromJson(element));
    }
  }

  void _getData() async {
    if (firstTime) {
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationRemote.getDeliverySendNotificationData(
        userId: userId,
      );
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          fetchData(response[ApiResult.data]);
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
    if (notificationData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  Future<void> deleteNotification(int index) async {
    var response = await notificationRemote.deleteDeliverySendNotification(
      id: notificationData[index].id.toString(),
    );

    statusRequest = handleStatus(response);

    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        notificationData.removeAt(index);
        update();
      } else {
        alertDefault.snackBarDefault();
      }
    } else {
      update();
    }
  }
}
