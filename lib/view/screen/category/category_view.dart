import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/category/body_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoryControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarCategory.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<CategoryControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyCategoryView(),
            );
          },
        ),
      ),
    );
  }
}
