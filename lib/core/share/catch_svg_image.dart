import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/app_lottie.dart';
import 'package:admin_ecommerce/core/function/load_cached_svg.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CatchSvgImage extends StatelessWidget {
  const CatchSvgImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: loadCachedSvg("${ApiConstant.categoryImagePath}/$image"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Lottie.asset(
            AppLottie.loading,
            height: 50,
            width: 50,
          );
        } else if (snapshot.hasError) {
          return const Icon(AppIcon.error);
        } else {
          return snapshot.data!;
        }
      },
    );
  }
}
