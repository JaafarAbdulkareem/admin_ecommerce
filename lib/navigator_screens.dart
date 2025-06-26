import 'package:admin_ecommerce/view/screen/auth/forget_password/forget_password_view.dart';
import 'package:admin_ecommerce/view/screen/auth/forget_password/reset_password_view.dart';
import 'package:admin_ecommerce/view/screen/auth/forget_password/verification_view.dart';
import 'package:admin_ecommerce/view/screen/category/category_view.dart';
import 'package:admin_ecommerce/view/screen/category/insert_category_view.dart';
import 'package:admin_ecommerce/view/screen/category/update_category_view.dart';
import 'package:admin_ecommerce/view/screen/message/message_view.dart';
import 'package:admin_ecommerce/view/screen/message/users_message_view.dart';
import 'package:admin_ecommerce/view/screen/notification/notification_view.dart';
import 'package:admin_ecommerce/view/screen/onboarding/splash_view.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:admin_ecommerce/view/screen/auth/login_view.dart';
import 'package:admin_ecommerce/view/screen/home/home_view.dart';
import 'package:admin_ecommerce/view/screen/onboarding/choose_app_language_view.dart';
import 'package:admin_ecommerce/view/screen/order/delivery_order_view.dart';
import 'package:admin_ecommerce/view/screen/order/detail_order_view.dart';
import 'package:admin_ecommerce/view/screen/order/order_view.dart';
import 'package:admin_ecommerce/view/screen/order/receive_order_view.dart';
import 'package:admin_ecommerce/view/screen/product/insert_product_view.dart';
import 'package:admin_ecommerce/view/screen/product/product_view.dart';
import 'package:admin_ecommerce/view/screen/product/update_product_view.dart';
import 'package:admin_ecommerce/view/screen/report_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
      GetPage(
        name: ConstantScreenName.language,
        page: () => const ChooseAppLanguageView(),
        middlewares: [
          OnboardingMiddleware(),
        ],
      ),
      GetPage(
        name: ConstantScreenName.splash,
        page: () => const SplashView(),
      ),
//auth
      GetPage(
        name: ConstantScreenName.login,
        page: () => const LoginView(),
      ),
      GetPage(
        name: ConstantScreenName.forgetPassword,
        page: () => const ForgetPasswordView(),
      ),
      GetPage(
        name: ConstantScreenName.verifyCode,
        page: () => const VerificationView(),
      ),
      GetPage(
        name: ConstantScreenName.resetPassword,
        page: () => const ResetPasswordView(),
      ),
//home
      GetPage(
        name: ConstantScreenName.home,
        page: () => const HomeView(),
      ),
//category
      GetPage(
        name: ConstantScreenName.category,
        page: () => const CategoryView(),
      ),
      GetPage(
        name: ConstantScreenName.insertCategory,
        page: () => const InsertCategoryView(),
      ),
      GetPage(
        name: ConstantScreenName.updateCategory,
        page: () => const UpdateCategoryView(),
      ),
//product
      GetPage(
        name: ConstantScreenName.product,
        page: () => const ProductView(),
      ),
      GetPage(
        name: ConstantScreenName.insertProduct,
        page: () => const InsertProductView(),
      ),
      GetPage(
        name: ConstantScreenName.updateProduct,
        page: () => const UpdateProductView(),
      ),
//order
      GetPage(
        name: ConstantScreenName.order,
        page: () => const OrderView(),
      ),
      GetPage(
        name: ConstantScreenName.deliveryOrder,
        page: () => const DeliveryOrderView(),
      ),
      GetPage(
        name: ConstantScreenName.receiveOrder,
        page: () => const ReceiveOrderView(),
      ),
      GetPage(
        name: ConstantScreenName.detailOrder,
        page: () => const DetailOrderView(),
      ),
//message
      GetPage(
        name: ConstantScreenName.message,
        page: () => const MessageView(),
      ),
      GetPage(
        name: ConstantScreenName.usersMessage,
        page: () => const UsersMessageView(),
      ),
      // GetPage(
      //   name: ConstantScreenName.deliveryMessage,
      //   page: () => const DeliveryMessageView(),
      // ),
// //notification
//       GetPage(
//         name: ConstantScreenName.notification,
//         page: () => const NotificationView(),
//       ),
//report
      GetPage(
        name: ConstantScreenName.report,
        page: () => const ReportView(),
      ),
    ];
