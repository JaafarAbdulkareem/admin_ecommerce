import 'package:admin_ecommerce/controller/notification/receive_notification_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/notification/body_receive_notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveNotificationView extends StatelessWidget {
  const ReceiveNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ReceiveNotificationControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarReceiveNotification.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ReceiveNotificationControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyReceiveNotificationView(),
            );
          },
        ),
      ),
    );
  }
}
