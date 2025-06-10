import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/home_model.dart';

List<HomeModel> dataHomeFeature = [
  HomeModel(
    image: AppImages.imagesCategory,
    title: KeyLanguage.titleCategory,
    onPressed: () {
      // Navigator function for Category
    },
  ),
  HomeModel(
    image: AppImages.imagesProduct,
    title: KeyLanguage.titleProduct,
    onPressed: () {
      // Navigator function for Product
    },
  ),
  HomeModel(
    image: AppImages.imagesUsers,
    title: KeyLanguage.titleUsers,
    onPressed: () {
      // Navigator function for Users
    },
  ),
  HomeModel(
    image: AppImages.imagesOrder,
    title: KeyLanguage.titleOrders,
    onPressed: () {
      // Navigator function for Orders
    },
  ),
  HomeModel(
    image: AppImages.imagesReport,
    title: KeyLanguage.titleReport,
    onPressed: () {
      // Navigator function for Report
    },
  ),
  HomeModel(
    image: AppImages.imagesNotification,
    title: KeyLanguage.titleNotification,
    onPressed: () {
      // Navigator function for Notification
    },
  ),
  HomeModel(
    image: AppImages.imagesMessage,
    title: KeyLanguage.titleMessage,
    onPressed: () {
      // Navigator function for Message
    },
  ),
  HomeModel(
    image: AppImages.imagesDelivery,
    title: KeyLanguage.titleDelivery,
    onPressed: () {
      // Navigator function for Delivery
    },
  ),
  HomeModel(
    image: AppImages.imagesPayment,
    title: KeyLanguage.titlePayment,
    onPressed: () {
      // Navigator function for Payment
    },
  ),
  HomeModel(
    image: AppImages.imagesSetting,
    title: KeyLanguage.titleSetting,
    onPressed: () {
      // Navigator function for Setting
    },
  ),
];