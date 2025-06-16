import 'package:admin_ecommerce/controller/category/update_category_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/cancel_save_button.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/core/template/choose_image_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BodyUpdateCategoryView extends GetView<UpdateCategoryControllerImp> {
  const BodyUpdateCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyUpdateCategory,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.hintCategoryArabic.tr,
                label: KeyLanguage.labelCategoryArabic.tr,
                icon: AppIcon.category,
                controller: controller.arabicField,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              const SizedBox(height: 12),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.hintCategoryEnglish.tr,
                label: KeyLanguage.labelCategoryEnglish.tr,
                icon: AppIcon.category,
                controller: controller.englishField,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              const ChooseImageButtonWidget<UpdateCategoryControllerImp>(),
              const SizedBox(height: 6),
              GetBuilder<UpdateCategoryControllerImp>(
                id: ConstantKey.idChooseImage,
                builder: (controller) {
                  return controller.file != null
                      ? SvgPicture.file(
                          controller.file!,
                          height: 150,
                        )
                      : const SizedBox();
                },
              ),
              CancelSaveButton(
                cancelButton: controller.cancelButton,
                saveButton: controller.updateButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
