import 'package:admin_ecommerce/controller/product/update_product_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/product/body_update_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UpdateProductControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarUpdateProduct.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<UpdateProductControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyUpdateProductView(),
            );
          },
        ),
      ),
    );
  }
}
