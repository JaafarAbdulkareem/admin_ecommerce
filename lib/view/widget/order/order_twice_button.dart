import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTwiceButton extends StatelessWidget {
  const OrderTwiceButton({
    super.key,
    required this.detailButton,
    required this.confirmButton,
    required this.confirmWidget,
  });

  final VoidCallback detailButton, confirmButton;
  final Widget confirmWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: confirmButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.price,
              foregroundColor: AppColorText.textButton,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: confirmWidget,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButtonWidget(
            text: KeyLanguage.buttonDetail.tr,
            onTap: detailButton,
          ),
        ),
      ],
    );
  }
}
