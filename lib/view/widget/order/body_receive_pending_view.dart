import 'package:admin_ecommerce/controller/order/receive_order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/view/widget/order/item_receive_pending_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BodyReceivePendingView extends StatelessWidget {
  const BodyReceivePendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiveOrderControllerImp>(
      id: ConstantKey.idPickUpButton,
      builder: (controller) {
        return controller.receiveData.isEmpty
            ? Center(
                child: Lottie.asset(
                  AppLottie.nodata,
                  repeat: false,
                ),
              )
            : ListView.builder(
                itemCount: controller.receiveData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstantScale.horizonPage,
                    vertical: ConstantScale.verticalPage,
                  ),
                  child: ItemReceivePendingOrder(
                    data: controller.receiveData[index],
                  ),
                ),
              );
      },
    );
  }
}
