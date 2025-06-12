import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) async {
  bool shouldExit = await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.alertWantExit.tr,
        actions: [
          TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text(KeyLanguage.buttonYes.tr)),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(KeyLanguage.buttonNo.tr),
          ),
        ],
      ) ??
      true;

  return shouldExit;
}
