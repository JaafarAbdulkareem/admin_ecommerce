import 'package:admin_ecommerce/controller/base/base_notification_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/data/models/notification_model.dart';
import 'package:admin_ecommerce/view/widget/notification/item_list_notification.dart';
import 'package:admin_ecommerce/view/widget/notification/swipe_delete_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwipeDeleteItem<T extends BaseNotificationController> extends GetView<T> {
  const SwipeDeleteItem({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(data.id.toString()),
      confirmDismiss: (direction) async {
        controller.selectDirectionIcon(direction.index);
        return true;
      },
      onDismissed: (direction) {
        controller.deleteNotification(index);
      },
      background: Card(
        color: AppColor.wrong,
        child: Center(
          child: GetBuilder<T>(
            id: ConstantKey.idDeleteIcon,
            builder: (_) {
              return ListTile(
                leading: controller.dismissDirectionIndex ==
                        DismissDirection.startToEnd.index
                    ? const SwipeDeleteIcon()
                    : null,
                trailing: controller.dismissDirectionIndex ==
                        DismissDirection.endToStart.index
                    ? const SwipeDeleteIcon()
                    : null,
              );
            },
          ),
        ),
      ),
      child: ItemListNotification(data: data),
    );
  }
}
