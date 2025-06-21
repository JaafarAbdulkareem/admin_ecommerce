import 'package:flutter/material.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';

ElevatedButtonThemeData elevatedButtonTheme({required bool isDark}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.iconColor,
      foregroundColor:
          isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
    ),
  );
}
