import 'package:admin_ecommerce/controller/notification/send_notification_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/notification/body_send_notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendNotificationView extends StatelessWidget {
  const SendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SendNotificationControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarSendNotification.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SendNotificationControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodySendNotificationView(),
            );
          },
        ),
      ),
    );
  }
}
