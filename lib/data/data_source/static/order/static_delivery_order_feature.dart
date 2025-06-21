import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/order/order_feature_model.dart';
import 'package:admin_ecommerce/view/widget/order/body_delivery_accept_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_delivery_done_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_delivery_on_the_way_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_delivery_pending_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_delivery_prepare_view.dart';

const List<OrderFeatureModel> deliveryOrderFeature = [
  OrderFeatureModel(
    title: KeyLanguage.barPending,
    icon: AppIcon.barPending,
    body: BodyDeliveryPendingView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barProper,
    icon: AppIcon.barProper,
    body: BodyDeliveryPrepareView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barAccept,
    icon: AppIcon.barAccept,
    body: BodyDeliveryAcceptView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barOnTheWay,
    icon: AppIcon.barOnTheWay,
    body: BodyDeliveryOnTheWayView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barArchive,
    icon: AppIcon.barDone,
    body: BodyDeliveryDoneView(),
  ),
];
