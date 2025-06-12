import 'dart:io';
import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/upload_image.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_sheet_camera_gallery_widget.dart';
import 'package:admin_ecommerce/data/data_source/remote/category/category_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class InsertCategoryController extends GetxController {
  void addButton();
  void chooseImageButton();
}

class InsertCategoryControllerImp extends InsertCategoryController {
  late GlobalKey<FormState> keyInsertCategory;
  late TextEditingController englishField;
  late TextEditingController arabicField;
  late StatusRequest statusRequest;
  File? file;
  late CategoryRemote categoryRemote;
  late CategoryControllerImp categoryController;

  @override
  void onInit() {
    keyInsertCategory = GlobalKey<FormState>();
    arabicField = TextEditingController();
    englishField = TextEditingController();
    statusRequest = StatusRequest.success;
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
  void addButton() async {
    if (file != null) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoryRemote.insertCategory(
        arabicName: arabicField.text,
        englishName: englishField.text,
        file: file!,
      );
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          statusRequest = StatusRequest.success;
          CategoryControllerImp.firstTime = true;
          categoryController.getData();
          Get.back();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        update();
      }
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.messageInsertImage.tr,
      );
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
