import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartWidget extends GetView<ReportControllerImp> {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = controller.categoryData;
    int index = 0;

    return Column(
      children: [
        Text(
          KeyLanguage.titlePieCategory.tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: ConstantScale.chartHeight,
          child: PieChart(
            PieChartData(
              sections: entries
                  .map(
                    (e) => PieChartSectionData(
                      value: e.productCount.toDouble(),
                      title:
                          "${translateLanguage(arabic: e.arabicName, english: e.englishName)} : ${e.productCount.toString()}",
                      radius: ConstantScale.pieRadius * 1.5,
                      color:
                          Colors.primaries[index++ % Colors.primaries.length],
                      titleStyle: const TextStyle(
                        color: AppColorText.textButtonLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
