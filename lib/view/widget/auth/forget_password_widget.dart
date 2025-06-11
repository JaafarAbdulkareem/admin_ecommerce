import 'package:admin_ecommerce/controller/auth/login_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordWidget extends GetView<LoginControllerImp> {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          controller.goToForgetPassword();
        },
        child: Text(
          KeyLanguage.titleForgetPassword.tr,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
