import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:flutter/material.dart';

class FloatingActionCategoryButton extends StatelessWidget {
  const FloatingActionCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {},
      child: const Icon(AppIcon.add),
    );
  }
}
