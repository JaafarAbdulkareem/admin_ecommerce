import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

TextTheme textTheme() {
  return const TextTheme(
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColor.primary,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColorText.primary,
    ),
    // titleLarge: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontSize: 16,
    //   color: AppColorText.primary,

    //   // color: AppColorText.textButton,
    // ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColorText.textButton,
    ),
    // titleMedium: TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w600,
    //   color: AppColor.primary,
    // ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColorText.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColorText.textButton,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColor.price,
      fontWeight: FontWeight.w400,
      fontFamily: ConstantTextFons.sans,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColorText.primary,
      // fontFamily: ConstantTextFons.sans,
    ),

    labelLarge: TextStyle(
      fontSize: 12,
      color: AppColorText.secondary,
      fontWeight: FontWeight.bold,
    ),
  );
}
