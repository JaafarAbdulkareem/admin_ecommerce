import 'dart:io';

import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';
import 'package:admin_ecommerce/data/models/product_model.dart';

class ProductRemote {
  final Curd curd;

  ProductRemote({required this.curd});

  getData() async {
    var response = await curd.postData(
      ApiConstant.apiViewProduct,
      {},
    );
    return response.fold((left) => left, (right) => right);
  }

  insertProduct({
    required ProductModel data,
    required File file,
  }) async {
    var response = await curd.postDataWithFile(
      url: ApiConstant.apiInsertProduct,
      body: {
        ApiKey.arabicName: data.arabicName,
        ApiKey.englishName: data.englishName,
        ApiKey.arabicDescription: data.arabicDescription,
        ApiKey.englishDescription: data.englishDescription,
        ApiKey.count: data.count,
        ApiKey.active: data.active,
        ApiKey.price: data.price,
        ApiKey.discount: data.discount,
        ApiKey.categoryId: data.categoryId,
      },
      fieldFile: ApiKey.newImage,
      file: file,
    );
    return response.fold((left) => left, (right) => right);
  }

  deleteProduct({
    required String id,
    required String image,
  }) async {
    var response = await curd.postData(
      ApiConstant.apiDeleteProduct,
      {
        ApiKey.id: id,
        ApiKey.image: image,
      },
    );
    return response.fold((left) => left, (right) => right);
  }

  updateProduct({
    required ProductModel data,
    required File? file,
  }) async {
    dynamic response;
    if (file == null) {
      response = await curd.postData(
        ApiConstant.apiUpdateProduct,
        {
          ApiKey.id: data.id,
          ApiKey.arabicName: data.arabicName,
          ApiKey.englishName: data.englishName,
          ApiKey.image: "",
          ApiKey.arabicDescription: data.arabicDescription,
          ApiKey.englishDescription: data.englishDescription,
          ApiKey.count: data.count,
          ApiKey.active: data.active,
          ApiKey.price: data.price,
          ApiKey.discount: data.discount,
          ApiKey.categoryId: data.categoryId,
        },
      );
    } else {
      response = await curd.postDataWithFile(
        url: ApiConstant.apiUpdateProduct,
        body: {
          ApiKey.id: data.id,
          ApiKey.arabicName: data.arabicName,
          ApiKey.englishName: data.englishName,
          ApiKey.image: data.image,
          ApiKey.arabicDescription: data.arabicDescription,
          ApiKey.englishDescription: data.englishDescription,
          ApiKey.count: data.count,
          ApiKey.active: data.active,
          ApiKey.price: data.price,
          ApiKey.discount: data.discount,
          ApiKey.categoryId: data.categoryId,
        },
        fieldFile: ApiKey.newImage,
        file: file,
      );
    }
    return response.fold((left) => left, (right) => right);
  }
}
