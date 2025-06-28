import 'package:admin_ecommerce/controller/notification/send_notification_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/home/item_grid_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySendNotificationView extends GetView<SendNotificationControllerImp> {
  const BodySendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: ConstantScale.horizonPage),
        child: Row(
          children: controller.dataSendTypeFeature
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
