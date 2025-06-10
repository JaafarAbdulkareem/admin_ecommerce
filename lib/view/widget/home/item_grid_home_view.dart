import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemGridHomeView extends StatelessWidget {
  const ItemGridHomeView({
    super.key,
    required this.data,
  });
  final HomeModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        onPressed: data.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                data.image,
                height: ConstantScale.homeImageSize,
                width: ConstantScale.homeImageSize,
                fit: BoxFit.cover,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  data.title.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
