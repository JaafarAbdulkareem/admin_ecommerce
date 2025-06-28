import 'package:admin_ecommerce/controller/setting/setting_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/setting/style_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageThemeWidget extends GetView<SettingControllerImp> {
  const ChangeLanguageThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            ListTile(
              title: Text(KeyLanguage.darkMode.tr),
              trailing: StyleThemeMode(
                isDark: controller.isDarkMode.value,
                onChanged: (value) {
                  controller.changeTheme(value);
                },
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(KeyLanguage.language.tr),
              trailing: DropdownButton<String>(
                value: controller.currentLanguage.value,
                style: Theme.of(context).textTheme.bodySmall,
                items: controller.items,
                onChanged: (value) {
                  if (value != null) {
                    controller.changeLanguage(value);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
