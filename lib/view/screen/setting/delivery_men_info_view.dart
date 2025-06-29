import 'package:admin_ecommerce/controller/setting/delivrey_men_info_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/setting/body_delivery_men_info_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryMenInfoView extends StatelessWidget {
  const DeliveryMenInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DelivreyMenInfoControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarDeliveryInfo.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DelivreyMenInfoControllerImp>(
          builder: (controller) => HomeStatusView(
            statusRequest: controller.statusRequest,
            child: const BodyDeliveryMenInfoView(),
          ),
        ),
      ),
    );
  }
}
