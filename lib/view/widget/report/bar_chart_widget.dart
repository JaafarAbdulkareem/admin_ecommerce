import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarChartWidget extends GetView<ReportControllerImp> {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cities = controller.cityData;

    return Column(
      children: [
        Text(
          KeyLanguage.titleBarCity.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: ConstantScale.chartHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BarChart(
                BarChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        reservedSize: 30,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < cities.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                cities[index].city,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                        reservedSize: 42,
                        interval: 1,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: cities.isEmpty
                      ? []
                      : cities.asMap().entries.map((e) {
                          final i = e.key;
                          final city = e.value;
                          return BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: city.orderCount.toDouble(),
                                color: AppColor.barChart,
                                width: ConstantScale.barWidth,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          );
                        }).toList(),
                ),
              ),
              if (cities.isEmpty)
                Text(
                  KeyLanguage.noData.tr,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
            ],
          ),
        ),
      ],
    );
  }
}