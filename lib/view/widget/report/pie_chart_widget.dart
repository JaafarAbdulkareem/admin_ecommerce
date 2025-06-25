import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartWidget extends GetView<ReportControllerImp> {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          KeyLanguage.titlePieCategory.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: ConstantScale.chartHeight,
          child: Obx(
            () {
              final entries = controller.categoryData.entries.toList();
              return PieChart(
                PieChartData(
                  sections: entries.map(
                    (e) {
                      final idx = entries.indexOf(e);
                      final color =
                          Colors.primaries[idx % Colors.primaries.length];
                      return PieChartSectionData(
                        value: e.value,
                        title: "${e.key}: ${e.value.toInt()}",
                        color: color,
                        radius: ConstantScale.pieRadius * 1.5,
                        titleStyle:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColorText.textButtonLight,
                                ),
                      );
                    },
                  ).toList(),
                  // centerSpaceRadius: 40,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
