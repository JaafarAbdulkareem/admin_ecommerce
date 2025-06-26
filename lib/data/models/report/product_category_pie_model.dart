import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class ProductCategoryPieModel {
  final int categoryId;
  final String arabicName;
  final String englishName;
  final int productCount;

  const ProductCategoryPieModel({
    required this.categoryId,
    required this.arabicName,
    required this.englishName,
    required this.productCount,
  });

  factory ProductCategoryPieModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryPieModel(
        categoryId: int.parse(json[ApiColumnDb.categoryId]),
        arabicName: json[ApiColumnDb.arabicName],
        englishName: json[ApiColumnDb.englishName],
        productCount: int.parse(json[ApiColumnDb.productCount]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.categoryId: categoryId,
        ApiColumnDb.arabicName: arabicName,
        ApiColumnDb.englishName: englishName,
        ApiColumnDb.productCount: productCount,
      };
}
