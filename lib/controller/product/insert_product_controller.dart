import 'dart:io';
import 'package:admin_ecommerce/controller/base/base_choose_image_controller.dart';
import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/controller/product/product_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/function/upload_image.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_sheet_camera_gallery_widget.dart';
import 'package:admin_ecommerce/data/data_source/remote/product/product_remote.dart';
import 'package:admin_ecommerce/data/models/product/insert_product_model.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class InsertProductController extends BaseChooseImageController {
  void addButton();
  void changeActiveSwitch(bool value);
  DropDownState dropDownList();
}

class InsertProductControllerImp extends InsertProductController {
  late GlobalKey<FormState> keyInsertProduct;
  late TextEditingController arabicName;
  late TextEditingController englishName;
  late TextEditingController arabicDescription;
  late TextEditingController englishDescription;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController dropDown;
  late bool active;
  String? categoryId;
  File? file;
  late ProductRemote productRemote;
  late ProductControllerImp productController;

  late CategoryControllerImp categoryController;
  late List<SelectedListItem> selectListData;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    keyInsertProduct = GlobalKey<FormState>();
    arabicName = TextEditingController();
    englishName = TextEditingController();
    arabicDescription = TextEditingController();
    englishDescription = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropDown = TextEditingController();
    active = ConstantBool.initiActive;
    productRemote = ProductRemote(curd: Get.find());
    productController = Get.put(ProductControllerImp());

    categoryController = Get.put(CategoryControllerImp());
    selectListData = [];
    fetchDropDownListData();
    super.onInit();
  }

  @override
  void dispose() {
    arabicName.dispose();
    englishName.dispose();
    arabicDescription.dispose();
    englishDescription.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    dropDown.dispose();
    super.dispose();
  }

  void fetchDropDownListData() async {
    if (CategoryControllerImp.categoryData.isEmpty) {
      CategoryControllerImp.firstTime = true;
      await categoryController.getData();
    }
    for (var element in CategoryControllerImp.categoryData) {
      selectListData.add(
        SelectedListItem(
          value: element.id.toString(),
          name: translateLanguage(
            arabic: element.arabicName,
            english: element.englishName,
          ),
        ),
      );
    }
  }

  @override
  void addButton() async {
    if (keyInsertProduct.currentState!.validate()) {
      if (categoryId != null) {
        if (file != null) {
          InsertProductModel data = InsertProductModel(
            arabicName: arabicName.text,
            englishName: englishName.text,
            arabicDescription: arabicDescription.text,
            englishDescription: englishDescription.text,
            count: count.text,
            active: active.toString(),
            price: price.text,
            discount: discount.text,
            categoryId: categoryId!,
          );

          statusRequest = StatusRequest.loading;
          var response = await productRemote.insertProduct(
            data: data,
            file: file!,
          );
          statusRequest = handleStatus(response);
          if (statusRequest == StatusRequest.success) {
            if (response[ApiResult.status] == ApiResult.success) {
              statusRequest = StatusRequest.success;
              ProductControllerImp.firstTime = true;
              productController.getData();
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
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.alertInsertCategory.tr,
        );
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
    file = await pickFileFromGallery();
    Get.back();
  }

  @override
  void changeActiveSwitch(bool value) {
    active = value;
    update([ConstantKey.idActiveSwitch]);
  }

  @override
  DropDownState dropDownList() {
    return DropDownState(
      dropDown: DropDown(
        searchHintText: KeyLanguage.hintSearch.tr,
        data: selectListData,
        onSelected: (items) {
          dropDown.text = items[0].name;
          categoryId = items[0].value;
        },
      ),
    );
  }
}
