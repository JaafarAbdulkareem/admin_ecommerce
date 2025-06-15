import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/template/choose_image_button_widget.dart';
import 'package:admin_ecommerce/view/widget/product/active_price_text_form_field.dart';
import 'package:admin_ecommerce/view/widget/product/category_drop_down_list.dart';
import 'package:admin_ecommerce/view/widget/product/count_discount_text_form_field.dart';
import 'package:admin_ecommerce/view/widget/product/description_text_form_Field.dart';
import 'package:admin_ecommerce/view/widget/product/name_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInsertProductView extends GetView<InsertProductControllerImp> {
  const BodyInsertProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyInsertProduct,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: ConstantScale.margenInsertProduct * 2),
              const NameTextFormField(),
              const CountDiscountTextFormField(),
              const ActivePriceTextFormField(),
              const CategoryDropDownList(),
              const SizedBox(height: ConstantScale.margenInsertProduct),
              const ChooseImageButtonWidget<InsertProductControllerImp>(),
              const SizedBox(height: ConstantScale.margenInsertProduct),
              GetBuilder<InsertProductControllerImp>(
                id: ConstantKey.idChooseImage,
                builder: (controller) {
                  return controller.file != null
                      ? Image.file(
                          controller.file!,
                          height: ConstantScale.imageInsert,
                        )
                      : const SizedBox();
                },
              ),
              const SizedBox(height: ConstantScale.margenInsertProduct),
              const DescriptionTextFormField(),
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
