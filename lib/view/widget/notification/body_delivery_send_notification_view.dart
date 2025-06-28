import 'package:admin_ecommerce/controller/notification/delivery_send_notification_controller.dart';
import 'package:admin_ecommerce/view/widget/notification/swipe_delete_item.dart';
import 'package:flutter/material.dart';

class BodyDeliverySendNotificationView extends StatelessWidget {
  const BodyDeliverySendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView.builder(
        itemCount:
            DeliverySendNotificationControllerImp.notificationData.length,
        itemBuilder: (context, index) =>
            SwipeDeleteItem<DeliverySendNotificationControllerImp>(
          index: index,
          data: DeliverySendNotificationControllerImp.notificationData[index],
        ),
      ),
    );
  }
}
