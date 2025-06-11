import 'package:admin_ecommerce/controller/auth/login_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/custom_logo_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/forget_password_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyLoginView extends GetView<LoginControllerImp> {
  const BodyLoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyLogin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:ConstantScale.horizonPage),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomLogoWidget(),
            TitleDescriptionWidget(
              title: KeyLanguage.titleWelcome.tr,
              subTitle: KeyLanguage.loginContent.tr,
            ),
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
            GetBuilder<LoginControllerImp>(
              id: ConstantKey.idHintPassword,
              builder: (controller) => CustomTextFormFieldWidget(
                hint: KeyLanguage.passwordHint.tr,
                label: KeyLanguage.passwordLabel.tr,
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
            const ForgetPasswordWidget(),
            CustomButtonWidget(
              text: KeyLanguage.loginButton.tr,
              onTap: () {
                controller.loginOnTap();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
