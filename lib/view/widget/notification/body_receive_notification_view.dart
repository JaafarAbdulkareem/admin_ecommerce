import 'package:admin_ecommerce/controller/notification/receive_notification_controller.dart';
import 'package:admin_ecommerce/view/widget/notification/swipe_delete_item.dart';
import 'package:flutter/material.dart';

class BodyReceiveNotificationView extends StatelessWidget {
  const BodyReceiveNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView.builder(
        itemCount: ReceiveNotificationControllerImp.notificationData.length,
        itemBuilder: (context, index) =>
            SwipeDeleteItem<ReceiveNotificationControllerImp>(
          index: index,
          data: ReceiveNotificationControllerImp.notificationData[index],
        ),
      ),
    );
  }
}
