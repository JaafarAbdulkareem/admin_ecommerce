import 'package:admin_ecommerce/controller/setting/delivrey_men_info_controller.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryMenInfoTwiceButton extends GetView<DelivreyMenInfoControllerImp> {
  const DeliveryMenInfoTwiceButton({
    super.key,
    required this.phone,
    required this.email,
  });
  final String phone, email;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonWidget(
            text: KeyLanguage.buttonCall.tr,
            onTap: () {
              controller.onCall(phone);
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButtonWidget(
            text: KeyLanguage.buttonEmail.tr,
            onTap: () {
              controller.onEmail(email);
            },
          ),
        ),
      ],
    );
  }
}
