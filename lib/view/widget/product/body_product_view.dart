import 'package:admin_ecommerce/controller/product/product_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/product/item_list_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyProductView extends GetView<ProductControllerImp> {
  const BodyProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: ConstantScale.horizonPage,
        left: ConstantScale.horizonPage,
        top: ConstantScale.verticalPage,
        bottom: ConstantScale.verticalPage + 25,
      ),
      child: ListView.builder(
        itemCount: ProductControllerImp.productData.length,
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: ConstantScale.goodsAspectRatioCard,
          child: ItemListProductView(
            data: ProductControllerImp.productData[index],
            deleteOnTap: () {
              controller.deleteProduct(index);
            },
            updateOnTap: () {
              controller.goToUpdateProduct(index);
            },
          ),
        ),
      ),
    );
  }
}
