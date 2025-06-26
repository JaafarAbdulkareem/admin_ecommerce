import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class OrdersPerCityModel {
  final String city;
  final int orderCount;

  const OrdersPerCityModel({
    required this.city,
    required this.orderCount,
  });

  factory OrdersPerCityModel.fromJson(Map<String, dynamic> json) =>
      OrdersPerCityModel(
        city: json[ApiColumnDb.city],
        orderCount: int.parse(json[ApiColumnDb.orderCount]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.city: city,
        ApiColumnDb.orderCount: orderCount,
      };
}
