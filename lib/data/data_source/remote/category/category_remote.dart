import 'dart:io';

import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
// import 'package:admin_ecommerce/data/models/setting_model/address_model.dart';

class CategoryRemote {
  final Curd curd;

  CategoryRemote({required this.curd});

  getData() async {
    var response = await curd.postData(
      ApiConstant.apiViewCategory,
      {},
    );
    return response.fold((left) => left, (right) => right);
  }

  insertCategory({
    required CategoryModel data,
    required File file,
  }) async {
    var response = await curd.postDataWithFile(
      url: ApiConstant.apiInsertCategory,
      body: {
        ApiKey.arabicName: data.arabicName,
        ApiKey.englishName: data.englishName,
      },
      fieldFile: ApiKey.newImage,
      file: file,
    );
    return response.fold((left) => left, (right) => right);
  }

  deleteCategory({
    required String id,
    required String image,
  }) async {
    var response = await curd.postData(
      ApiConstant.apiDeleteCategory,
      {
        ApiKey.id: id,
        ApiKey.image: image,
      },
    );
    return response.fold((left) => left, (right) => right);
  }

  updateCategory({
    required CategoryModel data,
    required File? file,
  }) async {
    dynamic response;
    if (file == null) {
      response = await curd.postData(
        ApiConstant.apiUpdateCategory,
        {
          ApiKey.arabicName: data.arabicName,
          ApiKey.englishName: data.englishName,
        },
      );
    } else {
      response = await curd.postDataWithFile(
        url: ApiConstant.apiUpdateCategory,
        body: {
          ApiKey.arabicName: data.arabicName,
          ApiKey.englishName: data.englishName,
        },
        fieldFile: ApiKey.newImage,
        file: file,
      );
    }
    return response.fold((left) => left, (right) => right);
  }
}
