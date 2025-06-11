import 'package:admin_ecommerce/controller/auth/verification_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/auth/otp_text_field_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyVerifcationView extends GetView<VerificationControllerImp> {
  const BodyVerifcationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleDescriptionWidget(
            title:
                "${KeyLanguage.appBarVerification.tr} : ${controller.verifyCode}",
            subTitle:
                "${KeyLanguage.messageVerification.tr}${controller.email}",
          ),
          const SizedBox(height: 32),
          OtpTextFieldWidget(
            onSubmit: (String verifyCode) {
              controller.verificationOnTap(verifyCode: verifyCode);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
