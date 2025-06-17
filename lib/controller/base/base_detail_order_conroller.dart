import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

class BaseDetailOrderConroller extends GetxController {
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
}
