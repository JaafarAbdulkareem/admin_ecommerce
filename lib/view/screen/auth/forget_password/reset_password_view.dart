import 'package:admin_ecommerce/controller/auth/reset_password_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/auth/body_reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarRePassword.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodyResetPasswordView(),
          ),
        ),
      ),
    );
  }
}
