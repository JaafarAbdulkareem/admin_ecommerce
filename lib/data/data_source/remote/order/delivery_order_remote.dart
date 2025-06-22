import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class DeliveryOrderRemote {
  final Curd curd;

  DeliveryOrderRemote({required this.curd});

  // pendingOrder({
  //   required String id,
  //   required String userId,
  // }) async {
  //   var response = await curd.postData(ApiConstant.apiPendingOrder, {
  //     ApiKey.id: id,
  //     ApiKey.userId: userId,
  //   });
  //   return response.fold((left) => left, (right) => right);
  // }

  prepareOrder({
    required String id,
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiPrepareOrder, {
      ApiKey.id: id,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  onTheWayOrder({
    required String id,
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiOnTheWayOrder, {
      ApiKey.id: id,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  doneOrder({
    required String id,
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiDoneOrder, {
      ApiKey.id: id,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
