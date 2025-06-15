import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameTextFormField extends GetView<InsertProductControllerImp> {
  const NameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldWidget(
          hint: KeyLanguage.hintProductArabicName.tr,
          label: KeyLanguage.labelProductArabicName.tr,
          icon: AppIcon.product,
          controller: controller.arabicName,
          keyboardType: TextInputType.text,
          validator: (value) => validatorGeneral(value),
        ),
        const SizedBox(height: ConstantScale.margenInsertProduct),
        CustomTextFormFieldWidget(
          hint: KeyLanguage.hintProductEnglishName.tr,
          label: KeyLanguage.labelProductEnglishName.tr,
          icon: AppIcon.product,
          controller: controller.englishName,
          keyboardType: TextInputType.text,
          validator: (value) => validatorGeneral(value),
        ),
      ],
    );
  }
}
