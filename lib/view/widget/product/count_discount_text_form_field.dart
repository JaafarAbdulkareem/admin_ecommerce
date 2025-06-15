import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountDiscountTextFormField extends GetView<InsertProductControllerImp> {
  const CountDiscountTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormFieldWidget(
            hint: KeyLanguage.hintCount.tr,
            label: KeyLanguage.labelCount.tr,
            icon: AppIcon.count,
            controller: controller.count,
            keyboardType: TextInputType.text,
            validator: (value) => validatorGeneral(value),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: CustomTextFormFieldWidget(
            hint: KeyLanguage.hintDiscount.tr,
            label: KeyLanguage.labelDiscount.tr,
            icon: AppIcon.discount,
            controller: controller.discount,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
