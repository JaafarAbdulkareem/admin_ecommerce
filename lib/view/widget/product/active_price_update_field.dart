import 'package:admin_ecommerce/controller/product/update_product_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/validator.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:admin_ecommerce/view/widget/product/active_switch_update_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivePriceUpdateField extends GetView<UpdateProductControllerImp> {
  const ActivePriceUpdateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ActiveSwitchUpdateWidget(),
        const SizedBox(width: 14),
        Expanded(
          child: CustomTextFormFieldWidget(
            hint: "${KeyLanguage.hintPrice.tr} (${ConstantText.currencyPrice})",
            label: KeyLanguage.labelPrice.tr,
            icon: AppIcon.price,
            controller: controller.price,
            keyboardType: TextInputType.number,
            validator: (value) => validatorDigital(value),
          ),
        ),
      ],
    );
  }
}
