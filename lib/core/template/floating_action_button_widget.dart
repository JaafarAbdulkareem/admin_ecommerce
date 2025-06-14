import 'package:admin_ecommerce/controller/base/base_floating_button_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionButtonWidget<T extends BaseFloatingButtonController>
    extends GetView<T> {
  final IconData icon;
  const FloatingActionButtonWidget({super.key, this.icon = AppIcon.add});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        controller.goToInsertPage();
      },
      child: Icon(icon),
    );
  }
}
