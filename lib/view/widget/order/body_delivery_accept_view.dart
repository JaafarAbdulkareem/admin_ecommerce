import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/order/item_done_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BodyDeliveryAcceptView extends GetView<DeliveryOrderControllerImp> {
  const BodyDeliveryAcceptView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrderControllerImp>(
      id: ConstantKey.idAccepted,
      builder: (controller) {
        return controller.penddingOrderData.isEmpty
            ? Center(
                child: Lottie.asset(
                  AppLottie.nodata,
                  repeat: false,
                ),
              )
            : ListView.builder(
                itemCount: controller.doneOrderData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstantScale.horizonPage,
                    vertical: ConstantScale.verticalPage,
                  ),
                  child: ItemDoneOrder(
                    data: controller.doneOrderData[index],
                  ),
                ),
              );
      },
    );
  }
}
