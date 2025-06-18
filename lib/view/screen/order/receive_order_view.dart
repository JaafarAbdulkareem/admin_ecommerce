import 'package:admin_ecommerce/controller/order/receive_order_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/data/data_source/static/order/static_receive_order_feature.dart';
import 'package:admin_ecommerce/view/widget/order/navigator_bar_receive_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveOrderView extends StatelessWidget {
  const ReceiveOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ReceiveOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarReceiveOrder.tr,
        ),
      ),
      bottomNavigationBar: const NavigatorBarReceiveOrder(),
      body: SafeArea(
        child: GetBuilder<ReceiveOrderControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: receiveOrderFeature[controller.barIndex].body,
          ),
        ),
      ),
    );
  }
}
