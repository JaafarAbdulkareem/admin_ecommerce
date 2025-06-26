import 'package:admin_ecommerce/controller/message/users_message_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/message/body_users_message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersMessageView extends StatelessWidget {
  const UsersMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UsersMessageControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarUsersMessage.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<UsersMessageControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyUsersMessageView(),
            );
          },
        ),
      ),
    );
  }
}
