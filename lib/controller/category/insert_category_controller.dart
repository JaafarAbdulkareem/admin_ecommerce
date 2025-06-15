import 'dart:io';
import 'package:admin_ecommerce/controller/base/base_choose_image_controller.dart';
import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/upload_image.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/category/category_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class InsertCategoryController extends BaseChooseImageController {
  void addButton();
}

class InsertCategoryControllerImp extends InsertCategoryController {
  late GlobalKey<FormState> keyInsertCategory;
  late TextEditingController englishField;
  late TextEditingController arabicField;
  File? file;
  late CategoryRemote categoryRemote;
  late CategoryControllerImp categoryController;

  @override
  void onInit() {
    keyInsertCategory = GlobalKey<FormState>();
    arabicField = TextEditingController();
    englishField = TextEditingController();
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
  void addButton() async {
    if (keyInsertCategory.currentState!.validate()) {
      if (file != null) {
        statusRequest = StatusRequest.loading;
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
          middleText: KeyLanguage.alertInsertImage.tr,
        );
      }
    }
  }

  @override
  void chooseImageButton() async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idGalleryImage]);

    file = await pickFileFromGallery(isSvg: true);

    statusRequest = StatusRequest.success;
    update([ConstantKey.idGalleryImage]);
    if (file != null) {
      update([ConstantKey.idChooseImage]);
    }
  }
}
