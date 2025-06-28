import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/data/data_source/remote/notification/notification_remote.dart';
import 'package:get/get.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';

abstract class BaseNotificationController extends GetxController {
  late StatusRequest statusRequest;
  final NotificationRemote notificationRemote =
      NotificationRemote(curd: Get.find());

  int dismissDirectionIndex = 0;

  final AlertDefault alertDefault = AlertDefault();

  void selectDirectionIcon(int index) {
    dismissDirectionIndex = index;
    update([ConstantKey.idDeleteIcon]);
  }

  Future<void> deleteNotification(int index);
}
