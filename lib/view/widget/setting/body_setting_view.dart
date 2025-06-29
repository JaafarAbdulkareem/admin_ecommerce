import 'package:admin_ecommerce/controller/setting/setting_controller.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/setting/change_language_theme_widget.dart';
import 'package:admin_ecommerce/view/widget/setting/field_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySettingView extends GetView<SettingControllerImp> {
  const BodySettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FieldSetting(
          title: controller.email,
          icon: AppIcon.email,
          onTap: () {},
        ),
        Obx(() {
          return Card(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: Text(
                controller.hidePassword.value
                    ? ConstantText.obscureText * ConstantScale.settingNoPassword
                    : controller.password,
              ),
              trailing: InkWell(
                onTap: () {
                  controller.changeStatePassword();
                },
                child: Icon(
                  controller.hidePassword.value
                      ? AppIcon.closePassword
                      : AppIcon.openPassword,
                ),
              ),
            ),
          );
        }),
        FieldSetting(
          title: KeyLanguage.deliveryRegistor.tr,
          icon: AppIcon.login,
          onTap: () {
            controller.goToLoginDelivery();
          },
        ),
        const ChangeLanguageThemeWidget(),
        const SizedBox(height: 50),
        FieldSetting(
          title: KeyLanguage.logout.tr,
          icon: AppIcon.logout,
          onTap: () {
            controller.logout();
          },
        ),
      ],
    );
  }
}
