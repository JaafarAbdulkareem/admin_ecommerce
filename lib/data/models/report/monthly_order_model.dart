import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class MonthlyOrdersModel {
  final int month;
  final int orderCount;

  const MonthlyOrdersModel({
    required this.month,
    required this.orderCount,
  });

  factory MonthlyOrdersModel.fromJson(Map<String, dynamic> json) =>
      MonthlyOrdersModel(
        month: int.parse(json[ApiColumnDb.month]),
        orderCount: int.parse(json[ApiColumnDb.orderCount]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.month: month,
        ApiColumnDb.orderCount: orderCount,
      };
}
