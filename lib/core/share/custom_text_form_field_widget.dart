import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.minLines,
    this.maxLines = 1,
    required this.hint,
    required this.label,
    this.icon,
    required this.controller,
    this.onTap,
    this.validator,
    this.obscure = false,
    this.keyboardType,
    this.changeCasePassword,
  });
  final int? minLines, maxLines;
  final String hint, label;
  final IconData? icon;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextInputType? keyboardType;
  final VoidCallback? changeCasePassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        onTap: onTap,
        obscureText: obscure,
        keyboardType: keyboardType,
        obscuringCharacter: ConstantText.obscureText,
        style: Theme.of(context).textTheme.bodySmall,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: keyboardType == TextInputType.number
              ? IconButton(
                  onPressed: changeCasePassword,
                  icon: Icon(
                    obscure ? AppIcon.closePassword : AppIcon.openPassword,
                  ),
                )
              : Icon(icon),
        ),
      ),
    );
  }
}
