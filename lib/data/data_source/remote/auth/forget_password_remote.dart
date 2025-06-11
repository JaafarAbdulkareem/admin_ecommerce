import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class ForgetPasswordRemote {
  final Curd curd;

  ForgetPasswordRemote({required this.curd});
  getData({
    required String email,
  }) async {
    var response = await curd.postData(ApiConstant.apiForgetPassword, {
      ApiKey.email: email,
    });
    return response.fold((left) => left, (right) => right);
  }
}
