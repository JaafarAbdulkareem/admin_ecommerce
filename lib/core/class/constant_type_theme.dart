import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/theme/app_bar_theme.dart';
import 'package:admin_ecommerce/core/theme/floating_action_button_theme_data.dart';
import 'package:admin_ecommerce/core/theme/input_decoration_theme.dart';
import 'package:admin_ecommerce/core/theme/text_button_theme_data.dart';
import 'package:admin_ecommerce/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData englishTheme = ThemeData(
//     buttonTheme: ButtonThemeData(
//       buttonColor: AppColor.correct
//     ),

// iconButtonTheme:IconButtonThemeData(
//   style: IconButton.styleFrom(
//     backgroundColor: AppColor.correct,
//   ),
// ) ,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        return AppColorText.textButton; // Always white thumb
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary; // ON state
        }
        return AppColor.secondary; // OFF state
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.iconColor,
        foregroundColor: AppColor.primary,
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    cardColor: AppColor.card,
    textButtonTheme: textButtonThemeData(),
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    floatingActionButtonTheme: floatingActionButtonThemeData(),
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
