import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

Future<void> requestNotificationPremission() async {
  // NotificationSettings settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

//   // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   //   print('User granted permission');
//   // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//   //   print('User granted provisional permission');
//   // } else {
//   //   print('User declined or has not accepted permission');
//   // }
}

// // class AuthorizationStatusException implements Exception {}
// // class ProvisionalStatusException implements Exception {}

void notificationMessage() {
  AlertDefault alertDefault = AlertDefault();
  FirebaseMessaging.onMessage.listen((message) async {
    if (message.data.isNotEmpty) {
      String? pageId = message.data['pageid'];
      if (pageId == ConstantKey.idAcceptedPage) {
        String orderId = message.data[ApiKey.id];
        String deliveryName = message.data[ApiKey.deliveryName];
        String deliveryEmail = message.data[ApiKey.deliveryEmail];
        String deliveryPhone = message.data[ApiKey.deliveryPhone];

        if (Get.currentRoute == ConstantScreenName.deliveryOrder) {
          DeliveryOrderControllerImp deliveryOrderController =
              Get.find<DeliveryOrderControllerImp>();
          deliveryOrderController.refreshDeliveryOrderAccepted(
            id: orderId,
            name: deliveryName,
            email: deliveryEmail,
            phone: deliveryPhone,
          );
        } else if (Get.isRegistered<OrderControllerImp>()) {
          OrderControllerImp orderController = Get.find<OrderControllerImp>();
          orderController.refreshOrderAccepted(
            id: orderId,
            name: deliveryName,
            email: deliveryEmail,
            phone: deliveryPhone,
          );
        } else {
          OrderControllerImp.firstTime = true;
        }
      } else if (pageId == ConstantKey.idDonePage) {
        String orderId = message.data[ApiKey.id];

        if (Get.currentRoute == ConstantScreenName.deliveryOrder) {
          DeliveryOrderControllerImp deliveryOrderController =
              Get.find<DeliveryOrderControllerImp>();
          deliveryOrderController.refreshDeliveryOrderDone(id: orderId);
        } else if (Get.isRegistered<OrderControllerImp>()) {
          OrderControllerImp orderController = Get.find<OrderControllerImp>();
          orderController.refreshOrderDone(id: orderId);
        } else {
          OrderControllerImp.firstTime = true;
        }
      }
      await FlutterRingtonePlayer().playNotification();
      alertDefault.snackBarDefault(
        icon: AppIcon.notificationRing,
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? "",
      );
    }
  });
}

void fCMNotification() async {
  await requestNotificationPremission();
  notificationMessage();
}
