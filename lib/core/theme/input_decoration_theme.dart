import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: ConstantScale.horizonFieldText,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    isDense: ConstantBool.isDense,
    border: _outlineInputBorder(),
    enabledBorder: _outlineInputBorder(),
    focusedBorder: _outlineInputBorder(),
  );
}

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(
      color: AppColor.secondary,
    ),
  );
}
