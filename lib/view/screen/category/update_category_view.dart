import 'package:admin_ecommerce/controller/category/update_category_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/category/body_update_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCategoryView extends StatelessWidget {
  const UpdateCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UpdateCategoryControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarUpdateCategory.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<UpdateCategoryControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyUpdateCategoryView(),
            );
          },
        ),
      ),
    );
  }
}
