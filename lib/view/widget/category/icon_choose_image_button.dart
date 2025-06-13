import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class IconChooseImageButton extends StatelessWidget {
  const IconChooseImageButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: ConstantScale.iconChooseImage,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ConstantScale.textChooseImage,
            ),
          ),
        ],
      ),
    );
  }
}
