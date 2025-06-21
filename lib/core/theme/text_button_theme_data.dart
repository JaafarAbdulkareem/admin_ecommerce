import 'package:flutter/material.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';

TextButtonThemeData textButtonThemeData({required bool isDark}) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColor.primary,
      foregroundColor:
          isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
      textStyle: const TextStyle(
        fontSize: ConstantScale.buttonSize,
        fontFamily: ConstantTextFons.englishFont,
      ),
    ),
  );
}

// import 'package:admin_ecommerce/core/constant/app_color.dart';
// import 'package:admin_ecommerce/core/constant/constant_key.dart';
// import 'package:admin_ecommerce/core/constant/constant_scale.dart';
// import 'package:flutter/material.dart';

// TextButtonThemeData textButtonThemeData() {
//   return TextButtonThemeData(
//     style: TextButton.styleFrom(
//       backgroundColor: AppColor.primary,
//       foregroundColor: AppColorText.textButtonLight,
//       textStyle: const TextStyle(
//         fontSize: ConstantScale.buttonSize,
//         fontFamily: ConstantTextFons.englishFont,
//       ),
//     ),
//   );
// }
