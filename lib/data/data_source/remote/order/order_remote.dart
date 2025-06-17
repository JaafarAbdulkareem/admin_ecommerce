import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class OrderRemote {
  final Curd curd;

  OrderRemote({required this.curd});
  getData() async {
    var response = await curd.postData(ApiConstant.apiViewOrder, {});
    return response.fold((left) => left, (right) => right);
  }
}
