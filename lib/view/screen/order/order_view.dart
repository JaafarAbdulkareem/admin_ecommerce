import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarOrder.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<OrderControllerImp>(
          builder: (controller) => HomeStatusView(
            statusRequest: controller.statusRequest,
            child: const BodyOrderView(),
          ),
        ),
      ),
    );
  }
}
