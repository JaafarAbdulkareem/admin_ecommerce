import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/data/data_source/static/order/static_delivery_order_feature.dart';
import 'package:admin_ecommerce/view/widget/order/navigator_bar_delivery_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrderView extends StatelessWidget {
  const DeliveryOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DeliveryOrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarDeliveryOrder.tr,
        ),
      ),
      bottomNavigationBar: const NavigatorBarDeliveryOrder(),
      body: SafeArea(
        child: GetBuilder<DeliveryOrderControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: deliveryOrderFeature[controller.barIndex].body,
          ),
        ),
      ),
    );
  }
}
