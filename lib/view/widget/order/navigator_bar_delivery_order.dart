import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/data/data_source/static/order/static_delivery_order_feature.dart';
import 'package:admin_ecommerce/core/template/item_bar_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorBarDeliveryOrder extends StatelessWidget {
  const NavigatorBarDeliveryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrderControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          child: Row(
            children: List.generate(
              deliveryOrderFeature.length,
              (index) => Expanded(
                child: ItemBarOrder<DeliveryOrderControllerImp>(
                  data: deliveryOrderFeature[index],
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
