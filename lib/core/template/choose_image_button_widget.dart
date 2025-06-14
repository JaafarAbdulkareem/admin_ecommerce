import 'package:admin_ecommerce/controller/base/base_choose_image_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseImageButtonWidget<T extends BaseChooseImageController>
    extends GetView<T> {
  const ChooseImageButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ConstantScale.loadingChooseImage,
      child: ElevatedButton(
        child: GetBuilder<T>(
          id: ConstantKey.idGalleryImage,
          builder: (controller) {
            return CustomLoadingWidget(
              statusRequest: controller.statusRequest,
              child: Text(KeyLanguage.buttonChooseImage.tr),
            );
          },
        ),
        onPressed: () {
          controller.chooseImageButton();
        },
      ),
    );
  }
}


