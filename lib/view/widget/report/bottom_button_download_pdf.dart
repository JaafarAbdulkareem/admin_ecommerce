import 'package:admin_ecommerce/controller/report/report_controller.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BottomButtonDownloadPdf extends StatelessWidget {
  const BottomButtonDownloadPdf({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<ReportControllerImp>(
        id: ConstantKey.idDownloadPdf,
        builder: (controller) => controller.isClickSave
            ? AspectRatio(
                aspectRatio: 8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Lottie.asset(
                      AppLottie.loading,
                    ),
                  ),
                ),
              )
            : AspectRatio(
                aspectRatio: 8,
                child: ElevatedButton(
                  onPressed: () => controller.captureFullWidgetToPdf(),
                  child: Text(KeyLanguage.buttonDownloadPdf.tr),
                ),
              ),
      ),
    );
  }
}
