import 'package:admin_ecommerce/controller/notification/users_send_notification_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/notification/body_users_send_notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersSendNotificationView extends StatelessWidget {
  const UsersSendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UsersSendNotificationControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarUsersSendNotification.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<UsersSendNotificationControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyUsersSendNotificationView(),
            );
          },
        ),
      ),
    );
  }
}
