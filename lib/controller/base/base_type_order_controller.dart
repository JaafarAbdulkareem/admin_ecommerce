import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/on_call.dart';
import 'package:get/get.dart';

abstract class BaseTypeOrderController extends GetxController {
  final AlertDefault alertDefualt = AlertDefault();

  void changeBottonBar(int currentnIdex);
  void goToDetailOrder({
    required String id,
    required String userId,
  }) {
    Get.toNamed(
      ConstantScreenName.detailOrder,
      arguments: {
        ApiKey.id: id,
        ApiKey.userId: userId,
      },
    );
  }

  Future<void> onCall(String phone) async {
    onPhoneCall(phone);
  }
}
