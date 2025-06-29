abstract class ApiConstant {
  static const String server =
      "https://dfe2-2406-7400-70-d697-c5e6-812c-e462-c5e9.ngrok-free.app/"; // ngrok ngrok http --url=pleasantly-divine-bear.ngrok-free.app 80
  // static const String server = "http://192.168.0.113"; // home wifi
  // static const String server = "http://192.168.230.139";
  // static const String server = "http://192.168.50.139"; // mobile
  static const String project = "/project/ecommerce";
  static const String serverPath = "$server/$project";

  static const String imagePath = "$serverPath/upload";
  static const String categoryImagePath = "$imagePath/category";
  static const String productImagePath = "$imagePath/product";

  static const String folderAdmin = "$serverPath/Admin/";

  static const String folderAuth = "$folderAdmin/auth";
  static const String apiLogin = "$folderAuth/login.php";
  static const String apiVerification = "$folderAuth/verify_code.php";
  static const String apiForgetPassword = "$folderAuth/forget_password.php";
  static const String apiResetPassword = "$folderAuth/reset_password.php";
  // static const String apiViewAuth = "$folderAuth/view_auth.php";

  static const String folderCategory = "$folderAdmin/category";
  static const String apiViewCategory = "$folderCategory/view_category.php";
  static const String apiInsertCategory = "$folderCategory/insert_category.php";
  static const String apiDeleteCategory = "$folderCategory/delete_category.php";
  static const String apiUpdateCategory = "$folderCategory/update_category.php";

  static const String folderProduct = "$folderAdmin/product";
  static const String apiViewProduct = "$folderProduct/view_product.php";
  static const String apiInsertProduct = "$folderProduct/insert_product.php";
  static const String apiDeleteProduct = "$folderProduct/delete_product.php";
  static const String apiUpdateProduct = "$folderProduct/update_product.php";

  static const String folderOrder = "$folderAdmin/order";
  static const String apiViewOrder = "$folderOrder/view_order.php";
  static const String apiViewDetailOrder = "$folderOrder/view_detail_order.php";
  // static const String apiPendingOrder = "$folderOrder/pending_order.php";
  static const String apiPrepareOrder = "$folderOrder/prepare_order.php";
  static const String apiOnTheWayOrder = "$folderOrder/on_the_way_order.php";
  static const String apiDoneOrder = "$folderOrder/done_order.php";
  static const String apiReceiveOrder = "$folderOrder/receive_order.php";

  static const String folderMessage = "$folderAdmin/message";
  static const String apiUsersMessageSend =
      "$folderMessage/users_insert_notification.php";
  static const String apiDeliveryMessageSend =
      "$folderMessage/delivery_insert_notification.php";

  static const String folderNotification = "$folderAdmin/notification";
  static const String apiViewNotification =
      "$folderNotification/view_notification.php";
  static const String apiViewUsersNotification =
      "$folderNotification/view_users_notification.php";
  static const String apiViewDeliveryNotification =
      "$folderNotification/view_delivery_notification.php";
  static const String apiDeleteNotification =
      "$folderNotification/delete_notification.php";
  static const String apiDeleteUsersNotification =
      "$folderNotification/delete_users_notification.php";
  static const String apiDeleteDeliveryNotification =
      "$folderNotification/delete_delivery_notification.php";

  static const String folderReport = "$folderAdmin/report";
  static const String apiViewReport = "$folderReport/view_report.php";

  static const String folderSetting = "$folderAdmin/setting";
  static const String apiViewDeliveryMen =
      "$folderSetting/view_delivery_men.php";
  static const String apiSignupDeliveryMan =
      "$folderSetting/signup_delivery.php";
  static const String apiDeleteDeliveryMen =
      "$folderSetting/delete_delivery_men.php";
}
