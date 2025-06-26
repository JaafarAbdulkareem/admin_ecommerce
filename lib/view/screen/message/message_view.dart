import 'package:admin_ecommerce/controller/message/message_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/message/body_message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MessageControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarMessage.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<MessageControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyMessageView(),
            );
          },
        ),
      ),
    );
  }
}
