import 'package:admin_ecommerce/controller/category/update_category_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelSaveButton extends GetView<UpdateCategoryControllerImp> {
  const CancelSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              controller.cancelButton();
            },
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
            onTap: () {
              controller.updateButton();
            },
          ),
        ),
      ],
    );
  }
}
