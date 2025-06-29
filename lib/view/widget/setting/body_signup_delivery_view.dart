import 'package:admin_ecommerce/controller/setting/signup_delivery_controller.dart';
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

class BodySignupDeliveryView extends GetView<SignupDeliveryControllerImp> {
  const BodySignupDeliveryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keySignup,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleDescriptionWidget(
                  title: KeyLanguage.deliveryRegistor.tr,
                  subTitle: KeyLanguage.messageRegisterDelivery.tr,
                ),
                const SizedBox(height: 32),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.hintUsername.tr,
                  label: KeyLanguage.labelUsername.tr,
                  icon: AppIcon.username,
                  controller: controller.username,
                  keyboardType: TextInputType.text,
                  validator: (value) => validator(
                    value,
                    ConstantKey.usernameValidator,
                    ConstantScale.minUsername,
                    ConstantScale.maxUsername,
                  ),
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.hintAge.tr,
                  label: KeyLanguage.labelAge.tr,
                  icon: AppIcon.age,
                  controller: controller.age,
                  keyboardType: TextInputType.number,
                  validator: (value) => validator(
                    value,
                    ConstantKey.ageValidator,
                    ConstantScale.minAge,
                    ConstantScale.maxAge,
                  ),
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.hintPhone.tr,
                  label: KeyLanguage.labelPhone.tr,
                  icon: AppIcon.phone,
                  controller: controller.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validator(
                    value,
                    ConstantKey.phoneValidator,
                    ConstantScale.minPhone,
                    ConstantScale.maxPhone,
                  ),
                ),
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
                Obx(
                  () => CustomTextFormFieldWidget(
                    hint: KeyLanguage.hintPassword.tr,
                    label: KeyLanguage.labelPassword.tr,
                    icon: AppIcon.closePassword,
                    controller: controller.password,
                    obscure: controller.hidePassword.value,
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
                const SizedBox(height: 32),
                CustomButtonWidget(
                  text: KeyLanguage.buttonSignup.tr,
                  onTap: () {
                    controller.signupOnTap();
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
