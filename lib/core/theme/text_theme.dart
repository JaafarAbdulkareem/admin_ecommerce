import 'package:admin_ecommerce/core/constant/app_color.dart';
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
    //   color: AppColorText.textButton,
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
    // bodyMedium: TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w600,
    // ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      // fontFamily: ConstantTextFons.sans,
    ),
  );
}
