import 'package:admin_ecommerce/controller/notification/notification_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/home/item_grid_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyNotificationView extends GetView<NotificationControllerImp> {
  const BodyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: ConstantScale.horizonPage),
        child: Row(
          children: controller.dataMessageTypeFeature
              .map(
                (e) => Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ItemGridHomeView(data: e),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
