import 'package:admin_ecommerce/controller/message/delivery_message_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/message/body_delivery_message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryMessageView extends StatelessWidget {
  const DeliveryMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DeliveryMessageControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarDeliveryMessage.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DeliveryMessageControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyDeliveryMessageView(),
            );
          },
        ),
      ),
    );
  }
}
