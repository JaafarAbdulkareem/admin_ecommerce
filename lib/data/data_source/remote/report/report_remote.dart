import 'package:admin_ecommerce/core/constant/api_constant.dart';
import 'package:admin_ecommerce/core/service/curd.dart';

class ReportRemote {
  final Curd curd;

  ReportRemote({required this.curd});

  getData() async {
    var response = await curd.postData(
      ApiConstant.apiViewReport,
      {},
    );
    return response.fold((left) => left, (right) => right);
  }
}
