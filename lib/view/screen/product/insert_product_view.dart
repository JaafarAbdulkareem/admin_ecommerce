import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/product/body_insert_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertProductView extends StatelessWidget {
  const InsertProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InsertProductControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarInsertProduct.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<InsertProductControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyInsertProductView(),
            );
          },
        ),
      ),
    );
  }
}
