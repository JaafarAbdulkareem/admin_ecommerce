import 'package:admin_ecommerce/controller/setting/delivrey_men_info_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/setting/delivery_info_model.dart';
import 'package:admin_ecommerce/view/widget/order/text_item_order.dart';
import 'package:admin_ecommerce/view/widget/setting/delivery_men_info_twice_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDeliveryMenInfo extends GetView<DelivreyMenInfoControllerImp> {
  const ItemDeliveryMenInfo({
    super.key,
    required this.data,
    required this.onDelete,
  });
  final DeliveryInfoModel data;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${KeyLanguage.deliveryId.tr}${data.id}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.primary),
                ),
                Text(
                  data.active
                      ? KeyLanguage.titleActive.tr
                      : KeyLanguage.titleInactive.tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: data.active ? AppColor.price : AppColor.wrong,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            TextItemOrder(
              text: "${KeyLanguage.nameDelivery.tr}${data.username}",
            ),
            TextItemOrder(
              text: "${KeyLanguage.ageDelivery.tr}${data.age}",
            ),
            TextItemOrder(
              text: "${KeyLanguage.phoneDelivery.tr}${data.phone}",
            ),
            TextItemOrder(
              text: "${KeyLanguage.emailDelivery.tr}${data.email}",
            ),
            TextItemOrder(
              text: "${KeyLanguage.passwordDelivery.tr}${data.password}",
            ),
            const Divider(),
            DeliveryMenInfoTwiceButton(
              phone: data.phone,
              email: data.email,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.wrong,
                    ),
                    onPressed: onDelete,
                    child: Text(
                      KeyLanguage.buttonDelete.tr,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
