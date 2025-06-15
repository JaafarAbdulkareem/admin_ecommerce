import 'package:admin_ecommerce/data/models/product/product_model.dart';

class CategoyTitleModel {
  final String id, categoryArabicName, categoryEnglishName;

  const CategoyTitleModel({
    required this.id,
    required this.categoryArabicName,
    required this.categoryEnglishName,
  });

  factory CategoyTitleModel.formProductData(ProductModel productData) {
    return CategoyTitleModel(
      id: productData.id,
      categoryArabicName: productData.categoryArabicName,
      categoryEnglishName: productData.categoryEnglishName,
    );
  }
}
