import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData englishTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.primary,
      ),
    ),
    textTheme: textTheme(),
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColorText.textButton
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
    fontFamily: ConstantTextFons.englishFont,
  );

  static ThemeData arabicTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.primary,
      ),
    ),
    textTheme: textTheme(),
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
    fontFamily: ConstantTextFons.arabicFont,
  );
}
