import 'package:admin_ecommerce/core/localization/locale_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAppLanguageView extends GetView<LocaleController> {
  const ChooseAppLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LocaleController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  KeyLanguage.chooseLanguage.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const CustomTextButton(
                  text: KeyLanguage.arabic,
                  codeLanguage: ConstantLanguage.ar,
                ),
                const CustomTextButton(
                  text: KeyLanguage.english,
                  codeLanguage: ConstantLanguage.en,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
