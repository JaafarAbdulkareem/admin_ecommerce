import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class ProductModel {
  final String id;
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final String image;
  final int countProduct;
  final int count;
  final bool active;
  final double price;
  final double discount;
  final double discountPrice;
  final String timeCreate;
  final String categoryId;
  final String categoryArabicName;
  final String categoryEnglishName;
  final String categoryImage;
  final String categoryTimeCreate;
  final double rating;

  ProductModel({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.arabicDescription,
    required this.englishDescription,
    required this.image,
    required this.countProduct,
    required this.count,
    required this.active,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.timeCreate,
    required this.categoryId,
    required this.categoryArabicName,
    required this.categoryEnglishName,
    required this.categoryImage,
    required this.categoryTimeCreate,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiColumnDb.id]?.toString() ?? '',
      arabicName: json[ApiColumnDb.arabicName]?.toString() ?? '',
      englishName: json[ApiColumnDb.englishName]?.toString() ?? '',
      arabicDescription: json[ApiColumnDb.arabicDescription]?.toString() ?? '',
      englishDescription: json[ApiColumnDb.englishDescription]?.toString() ?? '',
      image: json[ApiColumnDb.image]?.toString() ?? '',
      countProduct: int.tryParse(json[ApiColumnDb.countProduct].toString()) ?? 0,
      count: int.tryParse(json[ApiColumnDb.count].toString()) ?? 0,
      active: json[ApiColumnDb.active].toString() == '1', // Assumes 1 = true, 0 = false
      price: double.tryParse(json[ApiColumnDb.price].toString()) ?? 0.0,
      discount: double.tryParse(json[ApiColumnDb.discount].toString()) ?? 0.0,
      discountPrice: double.tryParse(json[ApiColumnDb.discountPrice].toString()) ?? 0.0,
      timeCreate: json[ApiColumnDb.timeCreate]?.toString() ?? '',
      categoryId: json[ApiColumnDb.categoryId]?.toString() ?? '',
      categoryArabicName: json[ApiColumnDb.categoryArabicName]?.toString() ?? '',
      categoryEnglishName: json[ApiColumnDb.categoryEnglishName]?.toString() ?? '',
      categoryImage: json[ApiColumnDb.categoryImage]?.toString() ?? '',
      categoryTimeCreate: json[ApiColumnDb.categoryTimeCreate]?.toString() ?? '',
      rating: double.tryParse(json[ApiColumnDb.rating].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.arabicName: arabicName,
      ApiColumnDb.englishName: englishName,
      ApiColumnDb.arabicDescription: arabicDescription,
      ApiColumnDb.englishDescription: englishDescription,
      ApiColumnDb.image: image,
      ApiColumnDb.countProduct: countProduct,
      ApiColumnDb.count: count,
      ApiColumnDb.active: active ? 1 : 0, // Convert bool back to int
      ApiColumnDb.price: price,
      ApiColumnDb.discount: discount,
      ApiColumnDb.discountPrice: discountPrice,
      ApiColumnDb.timeCreate: timeCreate,
      ApiColumnDb.categoryId: categoryId,
      ApiColumnDb.categoryArabicName: categoryArabicName,
      ApiColumnDb.categoryEnglishName: categoryEnglishName,
      ApiColumnDb.categoryImage: categoryImage,
      ApiColumnDb.categoryTimeCreate: categoryTimeCreate,
      ApiColumnDb.rating: rating,
    };
  }
}
