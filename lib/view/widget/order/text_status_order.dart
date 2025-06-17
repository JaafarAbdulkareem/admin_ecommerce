import 'package:admin_ecommerce/core/function/commant_order.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStatusOrder extends StatelessWidget {
  const TextStatusOrder({
    super.key,
    required this.status,
  });

  final int status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              KeyLanguage.orderStatus.tr,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            commantOrderStatus(status),
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
