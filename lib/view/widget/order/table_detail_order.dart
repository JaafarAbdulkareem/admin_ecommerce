import 'package:admin_ecommerce/controller/order/detail_order_controller.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/order/text_item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableDetailOrder extends GetView<DetailOrderControllerImp> {
  const TableDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            TextItemOrder(text: KeyLanguage.titleProduct.tr),
            TextItemOrder(text: KeyLanguage.titlQeuantity.tr),
            TextItemOrder(text: KeyLanguage.titlePrice.tr),
          ],
        ),
        ...List.generate(
          controller.detailOrderData.productsData.length,
          (index) => TableRow(
            children: [
              Text(
                translateLanguage(
                  arabic:
                      controller.detailOrderData.productsData[index].arabicName,
                  english: controller
                      .detailOrderData.productsData[index].englishName,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                controller.detailOrderData.productsData[index].count.toString(),
                textAlign: TextAlign.center,
              ),
              Text(
                controller.detailOrderData.productsData[index].totalPrice
                    .toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
