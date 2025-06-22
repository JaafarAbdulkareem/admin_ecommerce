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
  // late DeliveryOrderControllerImp deliveryOrderController;
  print("***********************notificaiton");
  FirebaseMessaging.onMessage.listen((message) async {
    if (message.data.isNotEmpty) {
      print("***********************notificaiton Listen");
      String? pageId = message.data['pageid'];
      // String? pageName = message.data['pagename'];
      if (pageId == ConstantKey.idAcceptedPage) {
        String orderId = message.data[ApiKey.id];
        String deliveryName = message.data[ApiKey.deliveryName];
        String deliveryEmail = message.data[ApiKey.deliveryEmail];
        String deliveryPhone = message.data[ApiKey.deliveryPhone];

        // print("📦 Page ID: $pageId");
        // print("📦 Page Name: ${Get.currentRoute}");
        // print("🚚 Delivery ID: $orderId");
        // print("👤 Name: $deliveryName");
        // print("📧 Email: $deliveryEmail");
        // print("📞 Phone: $deliveryPhone");
        // print(
        //     ": ${Get.isRegistered<OrderControllerImp>()} : is in accept : ${Get.currentRoute == ConstantScreenName.deliveryOrder}");

        if (Get.currentRoute == ConstantScreenName.deliveryOrder) {
          DeliveryOrderControllerImp deliveryOrderController =
              Get.find<DeliveryOrderControllerImp>();
          deliveryOrderController.refreshAccepted(
            id: orderId,
            name: deliveryName,
            email: deliveryEmail,
            phone: deliveryPhone,
          );
        } else if (Get.isRegistered<OrderControllerImp>()) {
          OrderControllerImp orderController = Get.find<OrderControllerImp>();
          orderController.refreshAccepted(
            id: orderId,
            name: deliveryName,
            email: deliveryEmail,
            phone: deliveryPhone,
          );
        } else {
          OrderControllerImp.firstTime = false;
          OrderControllerImp orderController = Get.put(OrderControllerImp());
          orderController.refreshFirstAccepted(
            id: orderId,
            name: deliveryName,
            email: deliveryEmail,
            phone: deliveryPhone,
          );
        }
      } else if (pageId == ConstantKey.idDonePage) {
        // OrderControllerImp.firstTime = false;
        // OrderControllerImp orderController = Get.put(OrderControllerImp());
        // OrderControllerImp.firstTime = true;
        // orderController.getData();
      }
    }

    await FlutterRingtonePlayer().playNotification();
    alertDefault.snackBarDefault(
      icon: AppIcon.notificationRing,
      title: message.notification?.title ?? "",
      body: message.notification?.body ?? "",
    );
  });
}

void fCMNotification() async {
  await requestNotificationPremission();
  notificationMessage();
}
