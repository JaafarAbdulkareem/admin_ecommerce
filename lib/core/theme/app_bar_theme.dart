import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:flutter/material.dart';

AppBarTheme appBarTheme({required bool isDark}) {
  return AppBarTheme(
    centerTitle: ConstantBool.appBarTitleCenter,
    backgroundColor: isDark ? Colors.black : AppColor.primary,
    foregroundColor: isDark ? Colors.white : AppColorText.textButtonLight,
  );
}

// import 'package:admin_ecommerce/core/constant/app_color.dart';
// import 'package:admin_ecommerce/core/constant/constant_bool.dart';
// import 'package:flutter/material.dart';

// AppBarTheme appBarTheme() {
//   return const AppBarTheme(
//     centerTitle: ConstantBool.appBarTitleCenter,
//     backgroundColor: AppColor.primary,
//     foregroundColor: AppColorText.textButtonLight,
//   );
// }
