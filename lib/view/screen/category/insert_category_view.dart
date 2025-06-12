import 'package:admin_ecommerce/controller/category/insert_category_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/category/body_insert_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertCategoryView extends StatelessWidget {
  const InsertCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InsertCategoryControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarInsertCategory.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<InsertCategoryControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyInsertCategoryView(),
            );
          },
        ),
      ),
    );
  }
}
