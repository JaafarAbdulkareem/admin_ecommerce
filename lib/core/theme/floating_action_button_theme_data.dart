import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

FloatingActionButtonThemeData floatingActionButtonThemeData(
    {required bool isDark}) {
  return FloatingActionButtonThemeData(
    backgroundColor: isDark ? Colors.grey[800]! : AppColor.primary,
    foregroundColor: isDark ? Colors.white : AppColorText.textButtonLight,
  );
}

// import 'package:admin_ecommerce/core/constant/app_color.dart';
// import 'package:flutter/material.dart';

// FloatingActionButtonThemeData floatingActionButtonThemeData() {
//   return const FloatingActionButtonThemeData(
//     backgroundColor: AppColor.primary,
//     foregroundColor: AppColorText.textButtonLight,
//   );
// }
