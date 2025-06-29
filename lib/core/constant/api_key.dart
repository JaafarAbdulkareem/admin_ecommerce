//php Body
abstract class ApiKey {
//Auth
  static const String email = "email";
  static const String password = "password";
  static const String verifyCode = "verifyCode";
//category
  static const String id = "id";
  static const String arabicName = "arabicName";
  static const String englishName = "englishName";
  static const String arabicDescription = "arabicDescription";
  static const String englishDescription = "englishDescription";
  static const String image = "image";
  static const String newImage = "newImage";
  static const String count = "count";
  static const String active = "active";
  static const String price = "price";
  static const String discount = "discount";
  static const String categoryId = "categoryId";
//order
  static const String userId = "userId";
  static const String deliveryName = "deliveryName";
  static const String deliveryEmail = "deliveryEmail";
  static const String deliveryPhone = "deliveryPhone";
//message
  static const String title = "title";
  static const String body = "body";
//setting
  static const String username = "username";
  static const String age = "age";
  static const String phone = "phone";
}

abstract class ApiResult {
  static const String status = "status";
  static const String data = "data";
  static const String success = "success";
  static const String failure = "failure";
  static const String noFound = "noFound";
  static const String found = "found";
  static const String noApprove = "noApprove";
  static const String category = "category";
  static const String product = "product";
  static const String verifyCode = "verifyCode";
}
