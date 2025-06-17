import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/data/data_source/static/static_order_feature.dart';
import 'package:admin_ecommerce/view/widget/order/item_bar_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderNavigatorBar extends StatelessWidget {
  const OrderNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrderControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          child: Row(
            children: List.generate(
              orderFeatures.length,
              (index) => Expanded(
                child: ItemBarOrder(
                  data: orderFeatures[index],
                  selected: index == controller.barIndex,
                  index: index,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
