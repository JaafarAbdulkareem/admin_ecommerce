import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/view/widget/order/item_pending_order.dart';
import 'package:flutter/material.dart';

class BodyOrderPendingView extends StatelessWidget {
  const BodyOrderPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("pending");
    // ListView.builder(
    //   itemCount: OrderControllerImp.orderData.length,
    //   itemBuilder: (context, index) => Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 16,
    //       vertical: 4,
    //     ),
    //     child: ItemListOrder(
    //       data: OrderControllerImp.orderData[index],
    //     ),
    //   ),
    // );
  }
}
