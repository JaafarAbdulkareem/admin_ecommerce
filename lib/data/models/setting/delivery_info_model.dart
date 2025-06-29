import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class DeliveryInfoModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String phone;

  const DeliveryInfoModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) {
    return DeliveryInfoModel(
      id: json[ApiColumnDb.id].toString(),
      username: json[ApiColumnDb.username],
      email: json[ApiColumnDb.email],
      password: json[ApiColumnDb.password],
      phone: json[ApiColumnDb.phone].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.username: username,
      ApiColumnDb.email: email,
      ApiColumnDb.password: password,
      ApiColumnDb.phone: phone,
    };
  }
}
