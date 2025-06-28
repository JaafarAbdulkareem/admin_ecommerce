import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> dialogWantDelete({
  required VoidCallback yesButton,
}) async {
  return await Get.defaultDialog(
    title: KeyLanguage.alert.tr,
    middleText: KeyLanguage.alertWantDelete.tr,
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(KeyLanguage.buttonNo.tr),
      ),
      TextButton(
        onPressed: yesButton,
        child: Text(KeyLanguage.buttonYes.tr),
      ),
    ],
  );
}
