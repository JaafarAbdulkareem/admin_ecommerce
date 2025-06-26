import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';
import 'package:admin_ecommerce/data/models/report/message_model.dart';

class DeliveryMessageRemote {
  final Curd curd;

  DeliveryMessageRemote({required this.curd});
  sendMessage({
    required MessageModel data,
    String? userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeliveryMessageSend, {
      ApiKey.title: data.title,
      ApiKey.body: data.body,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
