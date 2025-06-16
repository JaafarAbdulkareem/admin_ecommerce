import 'package:admin_ecommerce/controller/product/update_product_controller.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionUpdateField extends GetView<UpdateProductControllerImp> {
  const DescriptionUpdateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldWidget(
          hint: KeyLanguage.hintProductArabicDescription.tr,
          label: KeyLanguage.labelProductArabicDescription.tr,
          controller: controller.arabicDescription,
          maxLines: null,
          keyboardType: TextInputType.text,
          validator: (value) => validatorGeneral(value),
        ),
        CustomTextFormFieldWidget(
          hint: KeyLanguage.hintProductEnglishDescription.tr,
          label: KeyLanguage.labelProductEnglishDescription.tr,
          controller: controller.englishDescription,
          maxLines: null,
          keyboardType: TextInputType.text,
          validator: (value) => validatorGeneral(value),
        ),
      ],
    );
  }
}
