import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/category/choose_image_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSheetCameraGalleryWidget extends StatelessWidget {
  const CustomSheetCameraGalleryWidget({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
  });
  final VoidCallback cameraOnTap, galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ChooseImageButton(
                icon: AppIcon.camera,
                text: KeyLanguage.titleCamera.tr,
                onPressed: cameraOnTap,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ChooseImageButton(
                icon: AppIcon.gallery,
                text: KeyLanguage.titleGallery.tr,
                onPressed: galleryOnTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
