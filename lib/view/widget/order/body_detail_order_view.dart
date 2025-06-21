import 'package:admin_ecommerce/controller/order/detail_order_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/order/google_map_detail_order.dart';
import 'package:admin_ecommerce/view/widget/order/table_detail_order.dart';
import 'package:admin_ecommerce/view/widget/order/total_price_detail_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDetailOrderView extends GetView<DetailOrderControllerImp> {
  const BodyDetailOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${KeyLanguage.orderNumber.tr}${controller.detailOrderData.id}",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const TableDetailOrder(),
                  const SizedBox(height: 16),
                  TotalPriceDetailOrder(
                    price: controller.detailOrderData.price,
                    totalPrice: controller.detailOrderData.totalPrice,
                  ),
                  const SizedBox(height: 16),
                  if (controller.detailOrderData.status ==
                      ConstantScale.onWayOption)
                    const AspectRatio(
                      aspectRatio: 1,
                      child: GoogleMapDetailOrder(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
