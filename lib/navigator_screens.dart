import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:admin_ecommerce/view/screen/home/home_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
   GetPage(
        name: ConstantScreenName.home,
        page: () => const HomeView(),
        middlewares: [
          OnboardingMiddleware(),
        ],
      ),
];
