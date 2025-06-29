import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';

class InsertDeliveryInfoModel {
  final String username;
  final String age;
  final String email;
  final String password;
  final String phone;

  const InsertDeliveryInfoModel({
    required this.username,
    required this.age,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory InsertDeliveryInfoModel.fromJson(Map<String, dynamic> json) {
    return InsertDeliveryInfoModel(
      username: json[ApiColumnDb.username],
      age: json[ApiColumnDb.age],
      email: json[ApiColumnDb.email],
      password: json[ApiColumnDb.password],
      phone: json[ApiColumnDb.phone].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.username: username,
      ApiKey.age: age,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.phone: phone,
    };
  }
}
