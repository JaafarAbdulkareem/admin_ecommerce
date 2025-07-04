import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';
import 'package:get/get.dart';

List<HomeModel> dataHomeFeature = [
  HomeModel(
    image: AppImages.imagesCategory,
    title: KeyLanguage.titleCategory,
    onPressed: () {
      Get.toNamed(ConstantScreenName.category);
    },
  ),
  HomeModel(
    image: AppImages.imagesProduct,
    title: KeyLanguage.titleProduct,
    onPressed: () {
      Get.toNamed(ConstantScreenName.product);
    },
  ),
  HomeModel(
    image: AppImages.imagesOrder,
    title: KeyLanguage.titleOrders,
    onPressed: () {
      Get.toNamed(ConstantScreenName.order);
    },
  ),
  HomeModel(
    image: AppImages.imagesMessage,
    title: KeyLanguage.titleMessage,
    onPressed: () {
      Get.toNamed(ConstantScreenName.message);
    },
  ),
  HomeModel(
    image: AppImages.imagesNotification,
    title: KeyLanguage.titleNotification,
    onPressed: () {
      Get.toNamed(ConstantScreenName.notification);
    },
  ),
  HomeModel(
    image: AppImages.imagesReport,
    title: KeyLanguage.titleReport,
    onPressed: () {
      Get.toNamed(ConstantScreenName.report);
    },
  ),
  HomeModel(
    image: AppImages.imagesSetting,
    title: KeyLanguage.titleSetting,
    onPressed: () {
      Get.toNamed(ConstantScreenName.setting);
    },
  ),
];
