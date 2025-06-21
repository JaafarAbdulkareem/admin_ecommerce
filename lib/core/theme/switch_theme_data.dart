import 'package:flutter/material.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';

SwitchThemeData switchTheme({required bool isDark}) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.all(
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
    ),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      return states.contains(WidgetState.selected)
          ? AppColor.primary
          : AppColor.secondary;
    }),
  );
}
