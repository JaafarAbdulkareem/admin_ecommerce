// import 'package:admin_ecommerce/controller/auth/forget_password_controller.dart';
import 'package:admin_ecommerce/core/constant/app_style.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
// import 'package:admin_ecommerce/view/widget/auth/body_forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget"
         // KeyLanguage.forgetPassword.tr,
        ),
      ),
      body: SafeArea(
        child: Text("forget"),
        // GetBuilder<ForgetPasswordControllerImp>(
        //   builder: (controller) => StatusView(
        //     statusRequest: controller.statusRequest,
        //     child: BodyForgetPasswordView(),
        //   ),
        // ),
      ),
    );
  }
}
