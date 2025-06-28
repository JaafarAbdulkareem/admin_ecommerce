import 'package:admin_ecommerce/controller/notification/users_send_notification_controller.dart';
import 'package:admin_ecommerce/view/widget/notification/swipe_delete_item.dart';
import 'package:flutter/material.dart';

class BodyUsersSendNotificationView extends StatelessWidget {
  const BodyUsersSendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView.builder(
        itemCount: UsersSendNotificationControllerImp.notificationData.length,
        itemBuilder: (context, index) =>
            SwipeDeleteItem<UsersSendNotificationControllerImp>(
          index: index,
          data: UsersSendNotificationControllerImp.notificationData[index],
        ),
      ),
    );
  }
}
