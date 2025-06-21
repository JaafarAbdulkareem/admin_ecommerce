import 'package:admin_ecommerce/core/theme/elevated_button_theme_data.dart';
import 'package:admin_ecommerce/core/theme/switch_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/theme/app_bar_theme.dart';
import 'package:admin_ecommerce/core/theme/bottom_app_bar_theme.dart';
import 'package:admin_ecommerce/core/theme/floating_action_button_theme_data.dart';
import 'package:admin_ecommerce/core/theme/input_decoration_theme.dart';
import 'package:admin_ecommerce/core/theme/text_button_theme_data.dart';
import 'package:admin_ecommerce/core/theme/text_theme.dart';

abstract class ConstantTypeTheme {
  // English Light Theme
  static ThemeData englishLightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffoldLight,
    cardColor: AppColor.cardLight,
    bottomAppBarTheme: bottomAppBarTheme(isDark: false),
    switchTheme: switchTheme(isDark: false),
    elevatedButtonTheme: elevatedButtonTheme(isDark: false),
    textButtonTheme: textButtonThemeData(isDark: false),
    inputDecorationTheme: inputDecorationTheme(isDark: false),
    textTheme: textTheme(isDark: false),
    appBarTheme: appBarTheme(isDark: false),
    floatingActionButtonTheme: floatingActionButtonThemeData(isDark: false),
    fontFamily: ConstantTextFons.englishFont,
  );

  // English Dark Theme
  static ThemeData englishDarkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffoldDark,
    cardColor: AppColor.cardDark,
    bottomAppBarTheme: bottomAppBarTheme(isDark: true),
    switchTheme: switchTheme(isDark: true),
    elevatedButtonTheme: elevatedButtonTheme(isDark: true),
    textButtonTheme: textButtonThemeData(isDark: true),
    inputDecorationTheme: inputDecorationTheme(isDark: true),
    textTheme: textTheme(isDark: true),
    appBarTheme: appBarTheme(isDark: true),
    floatingActionButtonTheme: floatingActionButtonThemeData(isDark: true),
    fontFamily: ConstantTextFons.englishFont,
  );

  // Arabic Light Theme
  static ThemeData arabicLightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffoldLight,
    cardColor: AppColor.cardLight,
    bottomAppBarTheme: bottomAppBarTheme(isDark: false),
    switchTheme: switchTheme(isDark: false),
    elevatedButtonTheme: elevatedButtonTheme(isDark: false),
    textButtonTheme: textButtonThemeData(isDark: false),
    inputDecorationTheme: inputDecorationTheme(isDark: false),
    textTheme: textTheme(isDark: false),
    appBarTheme: appBarTheme(isDark: false).copyWith(
      centerTitle: true, // usually Arabic apps center title
      foregroundColor: AppColorText.textButtonLight,
      backgroundColor: AppColor.primary,
    ),
    floatingActionButtonTheme: floatingActionButtonThemeData(isDark: false),
    fontFamily: ConstantTextFons.arabicFont,
  );

  // Arabic Dark Theme
  static ThemeData arabicDarkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColor.backgroundScaffoldDark,
    cardColor: AppColor.cardDark,
    bottomAppBarTheme: bottomAppBarTheme(isDark: true),
    switchTheme: switchTheme(isDark: true),
    elevatedButtonTheme: elevatedButtonTheme(isDark: true),
    textButtonTheme: textButtonThemeData(isDark: true),
    inputDecorationTheme: inputDecorationTheme(isDark: true),
    textTheme: textTheme(isDark: true),
    appBarTheme: appBarTheme(isDark: true).copyWith(
      centerTitle: true,
      foregroundColor: AppColorText.textButtonDark,
      backgroundColor: AppColor.primary,
    ),
    floatingActionButtonTheme: floatingActionButtonThemeData(isDark: true),
    fontFamily: ConstantTextFons.arabicFont,
  );
}



// import 'package:admin_ecommerce/core/constant/app_color.dart';
// import 'package:admin_ecommerce/core/constant/constant_key.dart';
// import 'package:admin_ecommerce/core/constant/constant_scale.dart';
// import 'package:admin_ecommerce/core/theme/app_bar_theme.dart';
// import 'package:admin_ecommerce/core/theme/floating_action_button_theme_data.dart';
// import 'package:admin_ecommerce/core/theme/input_decoration_theme.dart';
// import 'package:admin_ecommerce/core/theme/text_button_theme_data.dart';
// import 'package:admin_ecommerce/core/theme/text_theme.dart';
// import 'package:flutter/material.dart';

// abstract class ConstantTypeTheme {
//   static ThemeData englishTheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColor.primary,
//       brightness: Brightness.light, // or .dark
//     ),
// //     buttonTheme: ButtonThemeData(
// //       buttonColor: AppColor.correct
// //     ),

// // iconButtonTheme:IconButtonThemeData(
// //   style: IconButton.styleFrom(
// //     backgroundColor: AppColor.correct,
// //   ),
// // ) ,
//     bottomAppBarTheme: const BottomAppBarTheme(
//       color: AppColor.backgroundScaffold,
//       shadowColor: AppColor.primary,
//       elevation: ConstantScale.elevation,
//     ),
//     switchTheme: SwitchThemeData(
//       thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
//         return AppColorText.textButtonLight; // Always white thumb
//       }),
//       trackColor: WidgetStateProperty.resolveWith<Color>((states) {
//         if (states.contains(WidgetState.selected)) {
//           return AppColor.primary; // ON state
//         }
//         return AppColor.secondary; // OFF state
//       }),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColor.iconColor,
//         foregroundColor: AppColor.primary,
//       ),
//     ),
//     scaffoldBackgroundColor: AppColor.backgroundScaffold,
//     cardColor: AppColor.card,
//     textButtonTheme: textButtonThemeData(),
//     inputDecorationTheme: inputDecorationTheme(),
//     textTheme: textTheme(),
//     appBarTheme: appBarTheme(),
//     floatingActionButtonTheme: floatingActionButtonThemeData(),
//     fontFamily: ConstantTextFons.englishFont,
//   );

  // static ThemeData arabicTheme = ThemeData(
  //   textButtonTheme: TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       backgroundColor: AppColor.primary,
  //     ),
  //   ),
  //   textTheme: textTheme(),
  //   scaffoldBackgroundColor: AppColor.backgroundScaffold,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: AppColor.primary,
  //   ),
  //   floatingActionButtonTheme:
  //       const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
  //   fontFamily: ConstantTextFons.arabicFont,
  // );
// }
