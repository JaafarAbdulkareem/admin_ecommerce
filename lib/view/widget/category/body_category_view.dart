import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/category/item_list_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyCategoryView extends GetView<CategoryControllerImp> {
  const BodyCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstantScale.horizonPage,
        vertical: ConstantScale.verticalPage,
      ),
      child: ListView.builder(
        // itemCount:1,
        itemCount: CategoryControllerImp.categoryData.length,
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: ConstantScale.categoryaspectRatioCard ,
          child: ItemListCategoryView(
            data: CategoryControllerImp.categoryData[index],
          ),
        ),
      ),
    );
  }
}
