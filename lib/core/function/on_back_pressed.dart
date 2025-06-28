import 'dart:io';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) async {
  String currentScreen = Get.currentRoute;
  bool shouldExit = currentScreen == ConstantScreenName.login ||
          currentScreen == ConstantScreenName.home
      ? await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.alertWantExit.tr,
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(KeyLanguage.buttonNo.tr),
              ),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(KeyLanguage.buttonYes.tr),
              ),
            ],
          ) ??
          true
      : false;
  return shouldExit;
}
