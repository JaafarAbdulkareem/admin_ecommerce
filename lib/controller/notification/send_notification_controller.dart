import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';
import 'package:get/get.dart';

abstract class SendNotificationController extends GetxController {}

class SendNotificationControllerImp extends SendNotificationController {
  late StatusRequest statusRequest;
  late List<HomeModel> dataSendTypeFeature;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    dataSendTypeFeature = [
      HomeModel(
        image: AppImages.imagesUsers,
        title: KeyLanguage.titleUsers,
        onPressed: () {
          goToUsersSendMessage();
        },
      ),
      HomeModel(
        image: AppImages.imagesDeliveryMan,
        title: KeyLanguage.titleDeliveries,
        onPressed: () {
          goToDeliverySendMessage();
        },
      ),
    ];
    super.onInit();
  }

  void goToUsersSendMessage() {
    Get.toNamed(ConstantScreenName.usersSendNotification);
  }

  void goToDeliverySendMessage() {
    Get.toNamed(ConstantScreenName.deliverySendNotification);
  }
}
