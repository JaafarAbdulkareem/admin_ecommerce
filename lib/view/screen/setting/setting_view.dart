import 'package:admin_ecommerce/controller/setting/setting_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:admin_ecommerce/view/widget/setting/body_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarSetting.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SettingControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodySettingView(),
            );
          },
        ),
      ),
    );
  }
}
