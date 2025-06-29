import 'package:admin_ecommerce/controller/setting/delivrey_men_info_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/setting/item_delivery_men_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDeliveryMenInfoView extends GetView<DelivreyMenInfoControllerImp> {
  const BodyDeliveryMenInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DelivreyMenInfoControllerImp.deliveryMenData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage,
        ),
        child: ItemDeliveryMenInfo(
          data: DelivreyMenInfoControllerImp.deliveryMenData[index],
          onDelete: () {
            controller.deleteDeliveryMan(index);
          },
        ),
      ),
    );
  }
}
