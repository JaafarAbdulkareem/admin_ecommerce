import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/commant_order.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:admin_ecommerce/view/widget/order/text_item_order.dart';
import 'package:admin_ecommerce/view/widget/order/text_status_order.dart';
import 'package:admin_ecommerce/view/widget/order/order_twice_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListOrder extends GetView<OrderControllerImp> {
  const ItemListOrder({
    super.key,
    required this.data,
  });
  final OrderModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${KeyLanguage.orderNumber.tr}${data.id}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColor.primary),
            ),
            const SizedBox(height: 6),
            TextItemOrder(
              text:
                  "${KeyLanguage.orderType.tr}${commantDeliveryChoose(data.typeDelivery)}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.orderPrice.tr}${data.price}${ConstantText.currencyPrice}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.deliveyPrice.tr}${data.deliveryPrice}${ConstantText.currencyPrice}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.paymentMethod.tr}${commantPaymentChoose(data.typePayment)}",
            ),
            TextStatusOrder(status: data.status),
            Text(
              "${KeyLanguage.totalPrice.tr} : ${data.totalPrice}${ConstantText.currencyPrice}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Divider(),
            OrderTwiceButton(
              detailButton: () {},
              confirmButton: () {},
              text: KeyLanguage.buttonPending,
            ),
          ],
        ),
      ),
    );
  }
}
