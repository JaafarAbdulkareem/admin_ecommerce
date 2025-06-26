import 'package:admin_ecommerce/controller/message/users_message_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyUsersMessageView extends GetView<UsersMessageControllerImp> {
  const BodyUsersMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key:controller.keyMessage,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ConstantScale.horizonPage,
            vertical: ConstantScale.verticalPage,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleDescriptionWidget(
                title: KeyLanguage.titleWelcome.tr,
                subTitle: KeyLanguage.messageUserMessage.tr,
              ),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.hintTitleMessage.tr,
                label: KeyLanguage.labelTitleMessage.tr,
                controller: controller.title,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.hintBodyMessage.tr,
                label: KeyLanguage.labelBodyMessage.tr,
                controller: controller.body,
                maxLines: null,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              const SizedBox(height: 16),
              CustomButtonWidget(
                text: KeyLanguage.buttonSend.tr,
                onTap: () {
                  controller.sendMessage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
