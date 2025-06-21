import 'package:admin_ecommerce/core/class/constant_type_theme.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/natoification.dart';
import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;
  late ThemeData _currentTheme;
  late StatusRequest statusRequest;
  late SharedPrefsService sharedPrefsService;

  ThemeMode themeMode = ThemeMode.system;

  // Determine current theme based on language and mode
  ThemeData get theme {
    if (themeMode == ThemeMode.dark) {
      return language.languageCode == ConstantLanguage.ar
          ? ConstantTypeTheme.arabicDarkTheme
          : ConstantTypeTheme.englishDarkTheme;
    } else {
      return language.languageCode == ConstantLanguage.ar
          ? ConstantTypeTheme.arabicLightTheme
          : ConstantTypeTheme.englishLightTheme;
    }
  }

  // Change language and update theme accordingly
  Future<void> changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    await sharedPrefsService.prefs.setString(
      ConstantKey.keyLanguage,
      languageCode,
    );
    language = locale;

    // Update _currentTheme according to language and current themeMode
    _currentTheme = theme;
    Get.changeTheme(_currentTheme);
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    super.onInit();

    statusRequest = StatusRequest.success;
    sharedPrefsService = Get.find<SharedPrefsService>();

    String? initLanguage = sharedPrefsService.prefs.getString(ConstantKey.keyLanguage);

    if (initLanguage == null) {
      language = Locale(Get.deviceLocale?.languageCode ?? ConstantLanguage.en);
    } else {
      language = Locale(initLanguage);
    }

    // Set initial theme
    _currentTheme = theme;
    Get.changeTheme(_currentTheme);
    Get.updateLocale(language);

    fCMNotification();
  }

  Future<void> goToOnboarding(String codeLanguage) async {
    statusRequest = StatusRequest.loading;
    update();

    await changeLanguage(codeLanguage);

    await Get.toNamed(ConstantScreenName.splash);

    statusRequest = StatusRequest.success;
    update();
  }

  // Toggle theme and update accordingly
  void toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _currentTheme = theme;
    Get.changeTheme(_currentTheme);
    update();
  }
}

// import 'package:admin_ecommerce/core/class/constant_type_theme.dart';
// import 'package:admin_ecommerce/core/class/status_request.dart';
// import 'package:admin_ecommerce/core/constant/constant_key.dart';
// import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
// import 'package:admin_ecommerce/core/function/natoification.dart';
// import 'package:admin_ecommerce/core/service/shared_prefs_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LocaleController extends GetxController {
//   late Locale language;
//   late ThemeData theme;
//   late StatusRequest statusRequest;
//   late SharedPrefsService sharedPrefsService;

//   changeLanguage(String languageCode) async {
//     Locale locale = Locale(languageCode);
//     await sharedPrefsService.prefs.setString(
//       ConstantKey.keyLanguage,
//       languageCode,
//     );
//     theme = languageCode == ConstantLanguage.ar
//         ? ConstantTypeTheme.arabicTheme
//         : ConstantTypeTheme.englishTheme;
//     Get.changeTheme(theme);
//     Get.updateLocale(locale);
//   }

//   @override
//   void onInit() async {
//     statusRequest = StatusRequest.success;
//     sharedPrefsService = Get.find<SharedPrefsService>();
//     String? initLanguage =
//         sharedPrefsService.prefs.getString(ConstantKey.keyLanguage);
//     if (initLanguage == null) {
//       language = Locale(Get.deviceLocale?.languageCode ?? ConstantLanguage.en);
//       theme = ConstantTypeTheme.englishTheme;
//     } else {
//       language = Locale(initLanguage);
//       theme = initLanguage == ConstantLanguage.ar
//           ? ConstantTypeTheme.arabicTheme
//           : ConstantTypeTheme.englishTheme;
//     }

//     fCMNotification();
//     super.onInit();
//   }

//   Future<void> goToOnboarding(String codeLanguage) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     await changeLanguage(codeLanguage);
//     await Get.toNamed(ConstantScreenName.splash);
//     statusRequest = StatusRequest.success;
//     update();
//   }
// }
