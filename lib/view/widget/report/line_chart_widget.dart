import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineChartWidget extends GetView<ReportControllerImp> {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          KeyLanguage.titleLineOrder.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: ConstantScale.chartHeight,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}',
                        style: Theme.of(context).textTheme.labelSmall,
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${value.toInt()}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: controller.monthlySeries,
                  isCurved: true,
                  barWidth: ConstantScale.lineWidth,
                  // color: AppColor.primary,
                  dotData: const FlDotData(show: false),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
