import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/order/item_done_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDeliveryDoneView extends GetView<DeliveryOrderControllerImp> {
  const BodyDeliveryDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.doneOrderData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage,
        ),
        child: ItemDoneOrder(
          data: controller.doneOrderData[index],
        ),
      ),
    );
  }
}
