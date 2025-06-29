import 'package:admin_ecommerce/controller/setting/signup_delivery_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/setting/body_signup_delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupDeliveryView extends StatelessWidget {
  const SignupDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupDeliveryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarSignup.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SignupDeliveryControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodySignupDeliveryView(),
          ),
        ),
      ),
    );
  }
}
