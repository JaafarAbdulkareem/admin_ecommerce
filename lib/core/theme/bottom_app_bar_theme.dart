import 'package:flutter/material.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';

BottomAppBarTheme bottomAppBarTheme({required bool isDark}) {
  return BottomAppBarTheme(
    color: isDark
        ? AppColor.backgroundScaffoldDark
        : AppColor.backgroundScaffoldLight,
    shadowColor: AppColor.primary,
    elevation: ConstantScale.elevation,
  );
}
