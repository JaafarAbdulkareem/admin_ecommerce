import 'package:admin_ecommerce/controller/order/receive_order_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/order/item_receive_done_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyReceiveDoneView extends GetView<ReceiveOrderControllerImp> {
  const BodyReceiveDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.archiveData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage,
        ),
        child: ItemReceiveDoneOrder(
          data: controller.archiveData[index],
        ),
      ),
    );
  }
}
