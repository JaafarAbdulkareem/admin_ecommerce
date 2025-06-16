import 'package:admin_ecommerce/controller/product/update_product_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryUpdateDropDown extends GetView<UpdateProductControllerImp> {
  const ListCategoryUpdateDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.dropDown,
      cursorColor: Colors.black,
      readOnly: ConstantBool.readOnly,
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      onTap: () {
        FocusScope.of(context).unfocus();
        controller.dropDownList().showModal(context);
      },
      decoration: InputDecoration(
        isDense: !ConstantBool.isDense,
        filled: ConstantBool.isFilled,
        fillColor: controller.dropDown.text.isEmpty
            ? AppColor.iconColor
            : AppColor.dropDown,
        hintText: KeyLanguage.hintProductDrop.tr,
        hintStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
