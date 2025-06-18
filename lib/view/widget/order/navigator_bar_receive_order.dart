import 'package:admin_ecommerce/controller/order/receive_order_controller.dart';
import 'package:admin_ecommerce/data/data_source/static/order/static_receive_order_feature.dart';
import 'package:admin_ecommerce/core/template/item_bar_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorBarReceiveOrder extends StatelessWidget {
  const NavigatorBarReceiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiveOrderControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          child: Row(
            children: List.generate(
              receiveOrderFeature.length,
              (index) => Expanded(
                child: ItemBarOrder<ReceiveOrderControllerImp>(
                  data: receiveOrderFeature[index],
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
