import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/order/order_feature_model.dart';
import 'package:admin_ecommerce/view/widget/order/body_order_done_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_order_on_the_way_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_order_pending_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_order_proper_view.dart';

const List<OrderFeatureModel> orderFeatures = [
  OrderFeatureModel(
    title: KeyLanguage.barPending,
    icon: AppIcon.barPending,
    body: BodyOrderPendingView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barProper,
    icon: AppIcon.barProper,
    body: BodyOrderProperView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barOnTheWay,
    icon: AppIcon.barOnTheWay,
    body: BodyOrderOnTheWayView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barDone,
    icon: AppIcon.barDone,
    body: BodyOrderDoneView(),
  ),
];
