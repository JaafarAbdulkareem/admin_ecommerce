class InsertProductModel {
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final String count;
  final String active;
  final String price;
  final String discount;
  final String categoryId;

  const InsertProductModel({
    required this.arabicName,
    required this.englishName,
    required this.arabicDescription,
    required this.englishDescription,
    required this.count,
    required this.active,
    required this.price,
    required this.discount,
    required this.categoryId,
  });
}
