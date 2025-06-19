import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/function/improve_price.dart';
import 'package:flutter/material.dart';

class PriceDetailItem extends StatelessWidget {
  const PriceDetailItem({
    super.key,
    required this.price,
    this.discount,
    this.discountPrice,
    this.style,
  });
  final double price;
  final double? discount, discountPrice;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        discount == null || discount == 0
            ? Text(
                improvePrice(amount: price),
                style: style ?? Theme.of(context).textTheme.bodyMedium,
              )
            : Row(
                children: [
                  Text(
                    improvePrice(amount: price),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3,
                          color: AppColor.wrong,
                        ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    improvePrice(amount: discountPrice!),
                    style: style ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
      ],
    );
  }
}
