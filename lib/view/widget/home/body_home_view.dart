import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/data/data_source/static/static_home_feature.dart';
import 'package:admin_ecommerce/view/widget/home/item_grid_home_view.dart';
import 'package:flutter/material.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ConstantScale.horizonPage,
          vertical: ConstantScale.verticalPage),
      child: GridView.builder(
        itemCount: dataHomeFeature.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ConstantScale.numberGridHome,
          childAspectRatio: ConstantScale.aspectRatio,
        ),
        itemBuilder: (context, index) => ItemGridHomeView(
          data: dataHomeFeature[index],
        ),
      ),
    );
  }
}
