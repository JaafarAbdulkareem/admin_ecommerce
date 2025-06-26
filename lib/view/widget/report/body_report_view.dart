import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/report/bar_chart_widget.dart';
import 'package:admin_ecommerce/view/widget/report/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/view/widget/report/item_grid_report.dart';
import 'package:admin_ecommerce/view/widget/report/line_chart_widget.dart';

class BodyPageOne extends GetView<ReportControllerImp> {
  const BodyPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            KeyLanguage.titleDashboard.tr,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.gridData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (_, index) =>
                ItemGridReport(data: controller.gridData[index]),
          ),
          const SizedBox(height: 32),
          const LineChartWidget(),
        ],
      ),
    );
  }
}

class BodyPageTwo extends StatelessWidget {
  const BodyPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BarChartWidget(),
          SizedBox(height: 32),
          PieChartWidget(),
          SizedBox(height: 64),
        ],
      ),
    );
  }
}
