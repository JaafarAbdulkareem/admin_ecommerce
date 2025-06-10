import 'package:admin_ecommerce/controller/home/home_controller.dart';
import 'package:admin_ecommerce/core/constant/app_style.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/view/widget/body_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: ConstantBool.appBarTitleCenter,
        title: Text(
          KeyLanguage.appBarHome.tr,
          style: AppStyle.styleBold16(context),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<HomeControllerImp>(
          builder: (context) {
            return const BodyHomeView();
          },
        ),
      ),
    );
  }
}
