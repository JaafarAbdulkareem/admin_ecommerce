import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:admin_ecommerce/core/template/choose_image_button_widget.dart';
import 'package:admin_ecommerce/view/widget/product/active_price_insert_field.dart';
import 'package:admin_ecommerce/view/widget/product/description_insert_field.dart';
import 'package:admin_ecommerce/view/widget/product/list_category_insert_drop_down.dart';
import 'package:admin_ecommerce/view/widget/product/count_discount_insert_field.dart';
import 'package:admin_ecommerce/view/widget/product/name_insert_field.dart';
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
              const NameInsertField(),
              const CountDiscountInsertField(),
              const ActivePriceInsertField(),
              const ListCategoryInsertDropDown(),
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
              const DescriptionInsertField(),
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
