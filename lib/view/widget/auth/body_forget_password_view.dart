import 'package:admin_ecommerce/controller/auth/forget_password_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyForgetPasswordView extends GetView<ForgetPasswordControllerImp> {
  const BodyForgetPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForgetPassword,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleDescriptionWidget(
              title: KeyLanguage.titleForgetPassword.tr,
              subTitle: KeyLanguage.forgetPasswordContent.tr,
            ),
            const SizedBox(height: 24),
            CustomTextFormFieldWidget(
              hint: KeyLanguage.emailHint.tr,
              label: KeyLanguage.emailLabel.tr,
              icon: AppIcon.email,
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => validator(
                value,
                ConstantKey.emailValidator,
                ConstantScale.minEmail,
                ConstantScale.maxEmail,
              ),
            ),
            const SizedBox(height: 12),
            CustomButtonWidget(
              text: KeyLanguage.checkButton.tr,
              onTap: () {
                controller.checkOnTap();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
