import 'package:admin_ecommerce/core/localization/locale_controller.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:admin_ecommerce/core/binding/initial_bindings.dart';
import 'package:admin_ecommerce/core/localization/translation_languages.dart';
import 'package:admin_ecommerce/navigator_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.initialService();
  // runApp(const MyApp());
  //remove
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      // //remove
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      debugShowCheckedModeBanner: false,
      title: 'Admin Ecommerce',
      theme: controller.theme,
      translations: TranslationLanguages(),
      locale: controller.language,
      initialBinding: InitialBindings(),
      // home: const VerificationView(),
      // home: const ChooseAppLanguage(),
      // const LoginView(),
      getPages: getPages,
    );
  }
}
