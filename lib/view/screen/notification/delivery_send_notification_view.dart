import 'package:admin_ecommerce/controller/notification/delivery_send_notification_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/notification/body_delivery_send_notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliverySendNotificationView extends StatelessWidget {
  const DeliverySendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DeliverySendNotificationControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarDeliverySendNotification.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DeliverySendNotificationControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyDeliverySendNotificationView(),
            );
          },
        ),
      ),
    );
  }
}
