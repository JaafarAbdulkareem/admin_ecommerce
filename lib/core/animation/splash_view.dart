import 'package:admin_ecommerce/controller/animation/splash_controller.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            opacity: controller.opacity.value,
            duration: const Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppLottie.splash,
                  height: 250,
                  fit: BoxFit.cover
                ),
                const SizedBox(height: 20),
                Text(KeyLanguage.titleSplash.tr,
                    style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
