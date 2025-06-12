import 'package:admin_ecommerce/controller/auth/reset_password_controller.dart';
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

class BodyResetPasswordView extends GetView<ResetPasswordControllerImp> {
  const BodyResetPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyResetPassword,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleDescriptionWidget(
              title: KeyLanguage.titleRePassword.tr,
              subTitle: KeyLanguage.resetPasswordContent.tr,
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormFieldWidget(
                hint: KeyLanguage.hintPassword.tr,
                label: KeyLanguage.labelPassword.tr,
                icon: AppIcon.closePassword,
                controller: controller.password,
                obscure: controller.hidePassword,
                keyboardType: TextInputType.number,
                validator: (value) => validator(
                  value,
                  ConstantKey.passwordValidator,
                  ConstantScale.minPassword,
                  ConstantScale.maxPassword,
                ),
                changeCasePassword: () {
                  controller.changeStatePassword();
                },
              ),
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormFieldWidget(
                hint: KeyLanguage.hintRePassword.tr,
                label: KeyLanguage.labelRePassword.tr,
                icon: AppIcon.closePassword,
                controller: controller.rePassword,
                obscure: controller.hideRepassword,
                keyboardType: TextInputType.number,
                validator: (value) => validator(
                  value,
                  ConstantKey.passwordValidator,
                  ConstantScale.minPassword,
                  ConstantScale.maxPassword,
                ),
                changeCasePassword: () {
                  controller.changeStateRepassword();
                },
              ),
            ),
            CustomButtonWidget(
              text: KeyLanguage.buttonSave.tr,
              onTap: () {
                controller.saveOnTap();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
