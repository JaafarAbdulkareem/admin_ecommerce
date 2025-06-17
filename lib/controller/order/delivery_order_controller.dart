import 'package:admin_ecommerce/controller/base/base_detail_order_conroller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/order/delivery_order_remote.dart';
import 'package:admin_ecommerce/data/models/order/order_model.dart';
import 'package:get/get.dart';

abstract class DeliveryOrderController extends BaseDetailOrderConroller {
  void changeBottonBar(int currentnIdex);
  void penddingButton({required String id, required String userId});
  void prepareButton({required String id, required String userId});
  void deliveryButton({required String id, required String userId});
}

class DeliveryOrderControllerImp extends DeliveryOrderController {
  late StatusRequest statusRequest;
  late int barIndex;
  late List<OrderModel> orderData;
  late List<OrderModel> penddingOrderData;
  late List<OrderModel> prepareOrderData;
  late List<OrderModel> onWayOrderData;
  late List<OrderModel> doneOrderData;
  late List<List<OrderModel>> data;
  late DeliveryOrderRemote deliveryOrderRemote;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    barIndex = ConstantScale.initiBarIndex;
    orderData = Get.arguments[ConstantKey.deliveryData];
    filterDeliveryStatusOrder();
    data = [penddingOrderData, prepareOrderData, onWayOrderData, doneOrderData];
    deliveryOrderRemote = DeliveryOrderRemote(curd: Get.find());
    super.onInit();
  }

  filterDeliveryStatusOrder() {
    penddingOrderData = [];
    prepareOrderData = [];
    onWayOrderData = [];
    doneOrderData = [];
    for (OrderModel element in orderData) {
      if (element.status == ConstantScale.pendingOption) {
        penddingOrderData.add(element);
      } else if (element.status == ConstantScale.prepareOption) {
        prepareOrderData.add(element);
      } else if (element.status == ConstantScale.onWayOption) {
        onWayOrderData.add(element);
      } else if (element.status == ConstantScale.doneDeliveryOption) {
        doneOrderData.add(element);
      }
    }

    print("Pending: ${penddingOrderData.length}, "
        "Preparing: ${prepareOrderData.length}, "
        "On the Way: ${onWayOrderData.length}, "
        "Done: ${doneOrderData.length}");
  }

  @override
  void changeBottonBar(int currentnIdex) {
    barIndex = currentnIdex;
    if (data[barIndex].isEmpty) {
      statusRequest = StatusRequest.failure;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void penddingButton({required String id, required String userId}) async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idPenddingButton + id]);
    var response = await deliveryOrderRemote.pendingOrder(
      id: id,
      userId: userId,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        prepareOrderData.add(penddingOrderData.firstWhere((e) => e.id == id));
        penddingOrderData.removeWhere((e) => e.id == id);
        statusRequest = StatusRequest.success;
        update([ConstantKey.idPenddingButton + id]);
        if (penddingOrderData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update([ConstantKey.idPenddingButton]);
        } else {
          update([ConstantKey.idPenddingButton]);
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([ConstantKey.idPenddingButton]);
      }
    } else {
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.alertSomeError.tr,
        backgroundColor: AppColor.snackbar,
      );
      update();
    }
  }

  @override
  void prepareButton({required String id, required String userId}) {
    // TODO: implement prepareButton
  }
  @override
  void deliveryButton({required String id, required String userId}) {
    // TODO: implement deliveryButton
  }
}
