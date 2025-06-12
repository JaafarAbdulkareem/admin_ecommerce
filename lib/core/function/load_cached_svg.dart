import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';

Future<Widget> loadCachedSvg(String imageUrl) async {
  final file = await DefaultCacheManager().getSingleFile(imageUrl);
  return SvgPicture.file(
    file,
    colorFilter: const ColorFilter.mode(AppColor.iconColor ,BlendMode.srcIn),
    width: ConstantScale.svgImage,
  );
}
