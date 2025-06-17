import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/data/models/order/order_feature_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBarOrder extends GetView<OrderControllerImp> {
  const ItemBarOrder({
    super.key,
    required this.data,
    required this.selected,
    required this.index,
  });
  final OrderFeatureModel data;
  final bool selected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 1)),
        onPressed: () {
          // controller.changeBottonBar(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              color: selected ? AppColor.primary : AppColorText.textButton,
              size: selected
                  ? ConstantScale.iconOrderSelect
                  : ConstantScale.iconOrderNotSelect,
            ),
            selected
                ? const SizedBox()
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      data.title.tr,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
