import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData englishTheme = ThemeData(
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColorText.primary,
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
    fontFamily: ConstantTextFons.englishFont,
  );
  static ThemeData arabicTheme = ThemeData(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColorText.primary,
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
    fontFamily: ConstantTextFons.arabicFont,
  );
}
