import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/static/static_order_feature.dart';
import 'package:admin_ecommerce/view/widget/order/order_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrderView extends StatelessWidget {
  const DeliveryOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarOrder.tr,
        ),
      ),
      bottomNavigationBar: const OrderNavigatorBar(),
      // body: SafeArea(
      //   child: GetBuilder<OrderControllerImp>(
      //     builder: (controller) =>
      //     // orderFeatures[controller.barIndex].body,
      //   ),
      // ),
    );
  }
}
