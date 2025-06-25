import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

TextTheme textTheme({bool isDark = false}) {
  return TextTheme(
    displaySmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColor.primary,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color:
          isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color:
          isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      // color: AppColor.price,
      fontWeight: FontWeight.w400,
      fontFamily: ConstantTextFons.sans,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
    ),
    labelLarge: const TextStyle(
      fontSize: 12,
      color: AppColorText.secondary,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
      fontWeight: FontWeight.w600,
    ),
  );
}

// import 'package:admin_ecommerce/core/constant/app_color.dart';
// import 'package:admin_ecommerce/core/constant/constant_key.dart';
// import 'package:flutter/material.dart';

// TextTheme textTheme() {
//   return const TextTheme(
//     displaySmall: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: AppColor.primary,
//     ),
//     headlineLarge: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//       color: AppColorText.primary,
//     ),
//     // titleLarge: TextStyle(
//     //   fontWeight: FontWeight.bold,
//     //   fontSize: 16,
//     //   color: AppColorText.primary,

//     //   // color: AppColorText.textButton,
//     // ),
//     titleMedium: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//       color: AppColorText.textButtonLight,
//     ),
//     // titleMedium: TextStyle(
//     //   fontSize: 16,
//     //   fontWeight: FontWeight.w600,
//     //   color: AppColor.primary,
//     // ),
//     titleSmall: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w300,
//       color: AppColorText.primary,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.bold,
//       color: AppColorText.textButtonLight,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 14,
//       color: AppColor.price,
//       fontWeight: FontWeight.w400,
//       fontFamily: ConstantTextFons.sans,
//     ),
//     bodySmall: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: AppColorText.primary,
//       // fontFamily: ConstantTextFons.sans,
//     ),

//     labelLarge: TextStyle(
//       fontSize: 12,
//       color: AppColorText.secondary,
//       fontWeight: FontWeight.bold,
//     ),
//   );
// }
