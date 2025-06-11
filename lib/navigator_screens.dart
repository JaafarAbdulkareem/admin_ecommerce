import 'package:admin_ecommerce/core/animation/splash_view.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:admin_ecommerce/view/screen/auth/login_view.dart';
import 'package:admin_ecommerce/view/screen/home/home_view.dart';
import 'package:admin_ecommerce/view/screen/onboarding/choose_app_language_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
      GetPage(
        name: ConstantScreenName.language,
        page: () => const ChooseAppLanguageView(),
        middlewares: [
          OnboardingMiddleware(),
        ],
      ),
      GetPage(
        name: ConstantScreenName.splash,
        page: () => const SplashView(),
      ),
      GetPage(
        name: ConstantScreenName.login,
        page: () => const LoginView(),
      ),
      GetPage(
        name: ConstantScreenName.home,
        page: () => const HomeView(),
      ),
    ];
