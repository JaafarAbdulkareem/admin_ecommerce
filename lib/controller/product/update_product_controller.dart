import 'dart:io';

import 'package:admin_ecommerce/controller/base/base_choose_image_controller.dart';
import 'package:admin_ecommerce/controller/category/category_controller.dart';
import 'package:admin_ecommerce/controller/product/product_controller.dart';
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/function/upload_image.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_sheet_camera_gallery_widget.dart';
import 'package:admin_ecommerce/data/data_source/remote/product/product_remote.dart';
import 'package:admin_ecommerce/data/models/product/insert_product_model.dart';
import 'package:admin_ecommerce/data/models/product/product_model.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UpdateProductController extends BaseChooseImageController {
  void updateButton();
  void cancelButton();
  void changeActiveSwitch(bool value);
  DropDownState dropDownList();
}

class UpdateProductControllerImp extends UpdateProductController {
  late GlobalKey<FormState> keyUpdateProduct;
  late ProductModel productData;

  late TextEditingController arabicName;
  late TextEditingController englishName;
  late TextEditingController arabicDescription;
  late TextEditingController englishDescription;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController dropDown;
  late bool active;
  late String categoryName;
  late String categoryId;
  File? file;

  late ProductRemote productRemote;
  late ProductControllerImp productController;

  late CategoryControllerImp categoryController;
  late List<SelectedListItem> selectListData;

  final AlertDefault alertDefualt = AlertDefault();

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    productData = Get.arguments[ConstantKey.productData];
    keyUpdateProduct = GlobalKey<FormState>();

    arabicName = TextEditingController(text: productData.arabicName);
    englishName = TextEditingController(text: productData.englishName);
    arabicDescription =
        TextEditingController(text: productData.arabicDescription);
    englishDescription =
        TextEditingController(text: productData.englishDescription);
    count = TextEditingController(text: productData.countProduct.toString());
    price = TextEditingController(text: productData.price.toString());
    discount = TextEditingController(text: productData.discount.toString());
    categoryName = translateLanguage(
      arabic: productData.categoryArabicName,
      english: productData.categoryEnglishName,
    );
    dropDown = TextEditingController(
      text: categoryName,
    );
    categoryId = productData.categoryId;
    active = productData.active;

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
  void updateButton() async {
    if (keyUpdateProduct.currentState!.validate()) {
      if (productData.arabicName == arabicName.text &&
          productData.englishName == englishName.text &&
          productData.arabicDescription == arabicDescription.text &&
          productData.englishDescription == englishDescription.text &&
          productData.countProduct.toString() == count.text &&
          productData.price.toString() == price.text &&
          productData.discount.toString() == discount.text &&
          categoryName == dropDown.text &&
          file == null) {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.alertNoThingChange.tr,
        );
      } else {
        statusRequest = StatusRequest.loading;
        update();
        InsertProductModel data = InsertProductModel(
          arabicName: arabicName.text,
          englishName: englishName.text,
          arabicDescription: arabicDescription.text,
          englishDescription: englishDescription.text,
          count: count.text,
          active: active.toString(),
          price: price.text,
          discount: discount.text,
          categoryId: categoryId,
        );
        var response = await productRemote.updateProduct(
          id: productData.id,
          image: productData.image,
          data: data,
          file: file,
        );

        print("response : $response");
        statusRequest = handleStatus(response);

        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            statusRequest = StatusRequest.success;
            ProductControllerImp.firstTime = true;
            productController.getData();
            Get.back();
          } else {
            Get.back();
          }
        } else {
          Get.back();
          alertDefualt.snackBarDefault();
        }
      }
    }
  }

  @override
  void cancelButton() {
    Get.back();
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
          categoryId = items[0].value!;
        },
      ),
    );
  }
}
