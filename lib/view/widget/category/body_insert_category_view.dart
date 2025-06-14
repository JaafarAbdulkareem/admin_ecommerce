import 'package:admin_ecommerce/controller/category/insert_category_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/core/template/choose_image_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BodyInsertCategoryView extends GetView<InsertCategoryControllerImp> {
  const BodyInsertCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyInsertCategory,
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
              const ChooseImageButtonWidget<InsertCategoryControllerImp>(),
              const SizedBox(height: 6),
              GetBuilder<InsertCategoryControllerImp>(
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
              CustomButtonWidget(
                text: KeyLanguage.buttonAdd.tr,
                onTap: () {
                  controller.addButton();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
