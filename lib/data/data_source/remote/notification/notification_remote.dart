import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class NotificationRemote {
  final Curd curd;

  NotificationRemote({required this.curd});

  getNotificationData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewNotification, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  getUsersSendNotificationData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewUsersNotification, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  getDeliverySendNotificationData({
    required String userId,
  }) async {
    var response =
        await curd.postData(ApiConstant.apiViewDeliveryNotification, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  deleteNotification({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteNotification, {
      ApiKey.id: id,
    });
    return response.fold((left) => left, (right) => right);
  }

  deleteUsersSendNotification({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteUsersNotification, {
      ApiKey.id: id,
    });
    return response.fold((left) => left, (right) => right);
  }

  deleteDeliverySendNotification({
    required String id,
  }) async {
    var response =
        await curd.postData(ApiConstant.apiDeleteDeliveryNotification, {
      ApiKey.id: id,
    });
    return response.fold((left) => left, (right) => right);
  }
}
