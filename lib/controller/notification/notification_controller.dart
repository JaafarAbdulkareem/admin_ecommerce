import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {}

class NotificationControllerImp extends NotificationController {
  late StatusRequest statusRequest;
  late List<HomeModel> dataMessageTypeFeature;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    dataMessageTypeFeature = [
      HomeModel(
        image: AppImages.imagesSendMessage,
        title: KeyLanguage.titleSendMessage,
        onPressed: () {
          goToSendMessage();
        },
      ),
      HomeModel(
        image: AppImages.imagesReceiveMessage,
        title: KeyLanguage.titleReceiveMessage,
        onPressed: () {
          goToReceiveMessage();
        },
      ),
    ];
    super.onInit();
  }

  void goToSendMessage() {
    Get.toNamed(ConstantScreenName.sendNotification);
  }

  void goToReceiveMessage() {
    Get.toNamed(ConstantScreenName.receiveNotification);
  }
}
