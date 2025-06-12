import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionCategoryButton extends GetView<CategoryControllerImp> {
  const FloatingActionCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        controller.goToInsertCategory();
      },
      child: const Icon(AppIcon.add),
    );
  }
}
