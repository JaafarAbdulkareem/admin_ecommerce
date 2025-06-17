import 'package:admin_ecommerce/controller/order/order_controller.dart';
import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
// import 'package:admin_ecommerce/data/data_source/static/static_order_type_feature.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';
import 'package:admin_ecommerce/view/widget/home/item_grid_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyOrderView extends GetView<OrderControllerImp> {
  const BodyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeModel> dataOrderTypeFeature = [
      HomeModel(
        image: AppImages.imagesDelivery,
        title: KeyLanguage.titleDelivery,
        onPressed: () {
          controller.goToDeliveryOrder();
        },
      ),
      HomeModel(
        image: AppImages.imagesReceive,
        title: KeyLanguage.titleReceive,
        onPressed: () {
          controller.goToReceiveOrder();
        },
      ),
    ];
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: ConstantScale.horizonPage),
        child: Row(
          children: dataOrderTypeFeature
              .map((e) => Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ItemGridHomeView(data: e),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
