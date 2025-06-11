// import 'package:admin_ecommerce/controller/auth/verification_controller.dart';
import 'package:admin_ecommerce/core/constant/app_style.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
// import 'package:admin_ecommerce/view/widget/auth/body_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => VerificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("verify code "
            // KeyLanguage.verifyTitle.tr,
            ),
      ),
      body: SafeArea(
        child: Text("verification"),
        // GetBuilder<VerificationControllerImp>(
        //   builder: (controller) => StatusView(
        //     statusRequest: controller.statusRequest,
        //     child: BodyVerifcationView(),
        //   ),
        // ),
      ),
    );
  }
}
