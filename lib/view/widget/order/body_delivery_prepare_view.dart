import 'package:admin_ecommerce/controller/order/delivery_order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/order/item_prepare_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BodyDeliveryPrepareView extends StatelessWidget {
  const BodyDeliveryPrepareView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrderControllerImp>(
      id: ConstantKey.idPrepareBody,
      builder: (controller) {
        return controller.prepareOrderData.isEmpty
            ? Center(
                child: Lottie.asset(
                  AppLottie.nodata,
                  repeat: false,
                ),
              )
            : ListView.builder(
                itemCount: controller.prepareOrderData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstantScale.horizonPage,
                    vertical: ConstantScale.verticalPage,
                  ),
                  child: ItemPrepareOrder(
                    data: controller.prepareOrderData[index],
                  ),
                ),
              );
      },
    );
  }
}
