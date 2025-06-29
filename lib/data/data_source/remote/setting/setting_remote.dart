import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';
import 'package:admin_ecommerce/data/models/setting/insert_delivery_info_model.dart';

class SettingRemote {
  final Curd curd;

  SettingRemote({required this.curd});

  getDeliveryData() async {
    var response = await curd.postData(
      ApiConstant.apiViewDeliveryMen,
      {},
    );
    return response.fold((left) => left, (right) => right);
  }

  signupDelivery({required InsertDeliveryInfoModel data}) async {
    var response = await curd.postData(
      ApiConstant.apiSignupDeliveryMan,
      data.toJson(),
    );
    return response.fold((left) => left, (right) => right);
  }

  deleteDelivery({required String id}) async {
    var response = await curd.postData(
      ApiConstant.apiDeleteDeliveryMen,
      {
        ApiKey.id: id,
      },
    );
    return response.fold((left) => left, (right) => right);
  }
}
