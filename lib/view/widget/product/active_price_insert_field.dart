import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/view/widget/product/active_switch_insert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivePriceInsertField extends GetView<InsertProductControllerImp> {
  const ActivePriceInsertField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ActiveSwitchInsertWidget(),
        const SizedBox(width: 14),
        Expanded(
          child: CustomTextFormFieldWidget(
            hint: "${KeyLanguage.hintPrice.tr} (${ConstantText.currencyPrice})",
            label: KeyLanguage.labelPrice.tr,
            icon: AppIcon.price,
            controller: controller.price,
            keyboardType: TextInputType.text,
            validator: (value) => validatorGeneral(value),
          ),
        ),
      ],
    );
  }
}
