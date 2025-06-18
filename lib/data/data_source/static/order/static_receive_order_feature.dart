import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/models/order/order_feature_model.dart';
import 'package:admin_ecommerce/view/widget/order/body_receive_done_view.dart';
import 'package:admin_ecommerce/view/widget/order/body_receive_pending_view.dart';

const List<OrderFeatureModel> receiveOrderFeature = [
  OrderFeatureModel(
    title: KeyLanguage.barPendingPickup,
    icon: AppIcon.barPending,
    body: BodyReceivePendingView(),
  ),
  OrderFeatureModel(
    title: KeyLanguage.barArchive,
    icon: AppIcon.barDone,
    body: BodyReceiveDoneView(),
  ),
];
