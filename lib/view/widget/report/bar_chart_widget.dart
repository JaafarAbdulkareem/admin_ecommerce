import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarChartWidget extends GetView<ReportControllerImp> {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          KeyLanguage.titleBarCity.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: ConstantScale.chartHeight,
          child: Obx(
            () {
              final entries = controller.cityData.entries.toList();
              return BarChart(
                BarChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              value.toInt().toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < entries.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                entries[index].key,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          } else {
                            return Container(); // empty widget for invalid index
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
                  barGroups: entries.asMap().entries.map(
                    (e) {
                      final i = e.key;
                      final val = e.value.value;
                      return BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: val,
                            color: Colors.orange,
                            width: ConstantScale.barWidth,
                            borderRadius: BorderRadius.circular(4),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
