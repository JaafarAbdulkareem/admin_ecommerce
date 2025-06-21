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
        return AspectRatio(
          aspectRatio: 2.6,
          child: BottomAppBar(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 10,
              children: List.generate(
                deliveryOrderFeature.length,
                (index) => SizedBox(
                  width: MediaQuery.of(context).size.width /
                      (deliveryOrderFeature.length - 1),
                  height: 55,
                  child: ItemBarOrder<DeliveryOrderControllerImp>(
                    data: deliveryOrderFeature[index],
                    selected: index == controller.barIndex,
                    index: index,
                  ),
                ),
              ),
            ),

            // child: Row(
            //   children: List.generate(
            //     deliveryOrderFeature.length,
            //     (index) => Expanded(
            //       child: ItemBarOrder<DeliveryOrderControllerImp>(
            //         data: deliveryOrderFeature[index],
            //         selected: index == controller.barIndex,
            //         index: index,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
