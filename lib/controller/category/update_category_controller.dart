import 'dart:io';
import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/upload_image.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_sheet_camera_gallery_widget.dart';
import 'package:admin_ecommerce/data/data_source/remote/category/category_remote.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UpdateCategoryController extends GetxController {
  void updateButton();
  void chooseImageButton();
}

class UpdateCategoryControllerImp extends UpdateCategoryController {
  late GlobalKey<FormState> keyUpdateCategory;
  late TextEditingController englishField;
  late TextEditingController arabicField;
  late CategoryModel categoryData;
  late StatusRequest statusRequest;
  File? file;
  late CategoryRemote categoryRemote;
  late CategoryControllerImp categoryController;

  @override
  void onInit() {
    keyUpdateCategory = GlobalKey<FormState>();
    categoryData = Get.arguments[ConstantKey.categoryData];
    arabicField = TextEditingController(text: categoryData.arabicName);
    englishField = TextEditingController(text: categoryData.englishName);
    statusRequest = StatusRequest.initial;
    categoryRemote = CategoryRemote(curd: Get.find());
    categoryController = Get.find<CategoryControllerImp>();

    super.onInit();
  }

  @override
  void dispose() {
    englishField.dispose();
    arabicField.dispose();
    super.dispose();
  }

  @override
  void updateButton() async {
    if (keyUpdateCategory.currentState!.validate()) {
      if (categoryData.arabicName == arabicField.text &&
          categoryData.englishName == englishField.text &&
          file == null) {
        Get.back();
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var response = await categoryRemote.updateCategory(
          data: CategoryModel(
            id: categoryData.id,
            arabicName: arabicField.text,
            englishName: englishField.text,
            image: categoryData.image,
            timeCreate: categoryData.timeCreate,
          ),
          file: file,
        );
        statusRequest = handleStatus(response);

        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            statusRequest = StatusRequest.success;
            CategoryControllerImp.firstTime = true;
            categoryController.getData();
            Get.back();
          } else {
            Get.back();
          }
        } else {
          Get.back();
          Get.snackbar(
            KeyLanguage.alert.tr,
            KeyLanguage.alertSomeError.tr,
            backgroundColor: AppColor.snackbar,
          );
        }
      }
    }
  }

  @override
  void chooseImageButton() async {
    await Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (context) {
          return CustomSheetCameraGalleryWidget(
            cameraOnTap: cameraOnTap,
            galleryOnTap: galleryOnTap,
          );
        },
      ),
    );

    if (file != null) {
      update([ConstantKey.idChooseImage]);
    }
  }

  void cameraOnTap() async {
    file = await pickImageFromCamera();
    Get.back();
  }

  void galleryOnTap() async {
    file = await pickFileFromGallery(isSvg: true);
    Get.back();
  }
}
