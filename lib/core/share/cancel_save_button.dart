import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelSaveButton extends StatelessWidget {
  const CancelSaveButton({
    super.key,
    required this.saveButton,
    required this.cancelButton,
  });

  final VoidCallback saveButton, cancelButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: cancelButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.wrong,
              foregroundColor: AppColorText.textButton,
            ),
            child: Text(KeyLanguage.buttonCancel.tr),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButtonWidget(
            text: KeyLanguage.buttonSave.tr,
            onTap: saveButton,
          ),
        ),
      ],
    );
  }
}
