import 'package:admin_ecommerce/controller/product/product_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/core/template/floating_action_button_widget.dart';
import 'package:admin_ecommerce/view/widget/product/body_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarProduct.tr,
        ),
      ),
      floatingActionButton:
          const FloatingActionButtonWidget<ProductControllerImp>(),
      body: SafeArea(
        child: GetBuilder<ProductControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyProductView(),
            );
          },
        ),
      ),
    );
  }
}
