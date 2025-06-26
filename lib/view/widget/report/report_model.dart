import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:admin_ecommerce/data/models/report/dashboard_counts_model.dart';
import 'package:admin_ecommerce/data/models/report/monthly_order_model.dart';
import 'package:admin_ecommerce/data/models/report/order_per_city_model.dart';
import 'package:admin_ecommerce/data/models/report/product_category_pie_model.dart';

class ReportModel {
  final DashboardCountsModel dashboardCounts;
  final List<MonthlyOrdersModel> monthlyOrders;
  final List<OrdersPerCityModel> ordersPerCity;
  final List<ProductCategoryPieModel> productCategoryPie;

  const ReportModel({
    required this.dashboardCounts,
    required this.monthlyOrders,
    required this.ordersPerCity,
    required this.productCategoryPie,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      dashboardCounts: DashboardCountsModel.fromJson(json[ApiColumnDb.dashboardCount]as Map<String, dynamic>),
      monthlyOrders: (json[ApiColumnDb.monthlyOrders] as List)
          .map((e) => MonthlyOrdersModel.fromJson(e))
          .toList(),
      ordersPerCity: (json[ApiColumnDb.ordersPerCity] as List)
          .map((e) => OrdersPerCityModel.fromJson(e))
          .toList(),
      productCategoryPie: (json[ApiColumnDb.productCategoryPie] as List)
          .map((e) => ProductCategoryPieModel.fromJson(e))
          .toList(),
    );
  }
}
