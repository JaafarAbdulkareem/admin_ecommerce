import 'package:admin_ecommerce/controller/product/insert_product_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveSwitchInsertWidget extends StatelessWidget {
  const ActiveSwitchInsertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(KeyLanguage.titleActive.tr),
        GetBuilder<InsertProductControllerImp>(
          id: ConstantKey.idActiveSwitch,
          builder: (controller) {
            return Switch(
              value: controller.active,
              onChanged: (value) {
                controller.changeActiveSwitch(value);
              },
            );
          },
        ),
      ],
    );
  }
}
