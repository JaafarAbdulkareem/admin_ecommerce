import 'package:admin_ecommerce/controller/product/update_product_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/share/cancel_save_button.dart';
import 'package:admin_ecommerce/core/template/choose_image_button_widget.dart';
import 'package:admin_ecommerce/view/widget/product/active_price_update_field.dart';
import 'package:admin_ecommerce/view/widget/product/description_update_field.dart';
import 'package:admin_ecommerce/view/widget/product/count_discount_update_field.dart';
import 'package:admin_ecommerce/view/widget/product/list_category_update_drop_down.dart';
import 'package:admin_ecommerce/view/widget/product/name_update_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyUpdateProductView extends GetView<UpdateProductControllerImp> {
  const BodyUpdateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyUpdateProduct,
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
              const NameUpdateField(),
              const CountDiscountUpdateField(),
              const ActivePriceUpdateField(),
              const ListCategoryUpdateDropDown(),
              const SizedBox(height: ConstantScale.margenInsertProduct),
              const ChooseImageButtonWidget<UpdateProductControllerImp>(),
              const SizedBox(height: ConstantScale.margenInsertProduct),
              GetBuilder<UpdateProductControllerImp>(
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
              const DescriptionUpdateField(),
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
