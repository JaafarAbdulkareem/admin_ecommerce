import 'package:admin_ecommerce/controller/login/login_controller.dart';
import 'package:admin_ecommerce/core/constant/constant_bool.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: ConstantBool.appBarTitleCenter,
        title: Text(
          KeyLanguage.appBarLogin.tr,
        ),
      ),
      body: SafeArea(
        child: Text("Login"),
        // GetBuilder<LoginControllerImp>(
        //   builder: (controller) => StatusView(
        //     statusRequest: controller.statusRequest,
        //     child: BodyLoginView(),
        //   ),
        // ),
      ),
    );
  }
}
