import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class DashboardCountsModel {
  final int totalUsers;
  final int totalDeliveryMen;
  final int activeProducts;
  final int inactiveProducts;
  final int totalOrders;

  const DashboardCountsModel({
    required this.totalUsers,
    required this.totalDeliveryMen,
    required this.activeProducts,
    required this.inactiveProducts,
    required this.totalOrders,
  });

  factory DashboardCountsModel.fromJson(Map<String, dynamic> json) =>
      DashboardCountsModel(
        totalUsers: int.parse(json[ApiColumnDb.totalUsers]),
        totalDeliveryMen: int.parse(json[ApiColumnDb.totalDeliveryMen]),
        activeProducts: int.parse(json[ApiColumnDb.activeProducts]),
        inactiveProducts: int.parse(json[ApiColumnDb.inactiveProducts]),
        totalOrders: int.parse(json[ApiColumnDb.totalOrders]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.totalUsers: totalUsers,
        ApiColumnDb.totalDeliveryMen: totalDeliveryMen,
        ApiColumnDb.activeProducts: activeProducts,
        ApiColumnDb.inactiveProducts: inactiveProducts,
        ApiColumnDb.totalOrders: totalOrders,
      };
}
