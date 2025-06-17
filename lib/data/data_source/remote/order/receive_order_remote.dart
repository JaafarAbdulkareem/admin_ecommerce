import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class ReceiveOrderRemote {
  final Curd curd;

  ReceiveOrderRemote({required this.curd});

  receiveOrder({
    required String id,
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiReceiveOrder, {
      ApiKey.id: id,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
