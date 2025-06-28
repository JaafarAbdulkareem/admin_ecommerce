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
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ConstantScale.horizonPage),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomLogoWidget(),
                const SizedBox(height: 40),
                TitleDescriptionWidget(
                  title: KeyLanguage.titleWelcome.tr,
                  subTitle: KeyLanguage.messageLogin.tr,
                ),
                const SizedBox(height: 25),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.hintEmail.tr,
                  label: KeyLanguage.labelEmail.tr,
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
                const SizedBox(height: 16),
                const ForgetPasswordWidget(),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  text: KeyLanguage.buttonLogin.tr,
                  onTap: () {
                    controller.loginOnTap();
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
