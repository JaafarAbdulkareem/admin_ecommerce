import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/order/price_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceDetailOrder extends StatelessWidget {
  const TotalPriceDetailOrder({
    super.key,
    required this.price,
    required this.totalPrice,
  });
  final double price, totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${KeyLanguage.totalPrice.tr} : ",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 4),
        PriceDetailItem(
          price: price,
          discount: price == totalPrice ? 0 : 1,
          discountPrice: totalPrice,
        ),
      ],
    );
  }
}
