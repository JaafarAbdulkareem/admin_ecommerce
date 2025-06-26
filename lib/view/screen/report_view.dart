import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/home_status_view.dart';
import 'package:admin_ecommerce/view/widget/report/body_report_view.dart';
import 'package:admin_ecommerce/view/widget/report/bottom_button_download_pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_ecommerce/controller/report/report_controller.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ReportControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarReport.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ReportControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RepaintBoundary(
                      key: controller.keyPage1,
                      child: const BodyPageOne(),
                    ),
                    const SizedBox(height: 16),
                    RepaintBoundary(
                      key: controller.keyPage2,
                      child: const BodyPageTwo(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: const BottomButtonDownloadPdf(),
    );
  }
}
