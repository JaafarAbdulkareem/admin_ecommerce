import 'package:admin_ecommerce/core/class/status_request.dart';

StatusRequest handleStatus(status) {
  if (status is StatusRequest) {
    return status;
  } else {
    return StatusRequest.success;
  }
}
