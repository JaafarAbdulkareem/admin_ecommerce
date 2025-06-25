import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/request_permission.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseTypeOrderController extends GetxController {
  final RequestPermission permissionHandler = RequestPermission();
  final AlertDefault alertDefualt = AlertDefault();

  void changeBottonBar(int currentnIdex);
  void goToDetailOrder({
    required String id,
    required String userId,
  }) {
    Get.toNamed(
      ConstantScreenName.detailOrder,
      arguments: {
        ApiKey.id: id,
        ApiKey.userId: userId,
      },
    );
  }

  Future<void> onCall(String phone) async {
    final status = await Permission.phone.status;

    if (status.isGranted) {
      _makeCall(phone);
    } else if (status.isDenied) {
      _showRequestPermissionDialog(phone);
    } else if (status.isPermanentlyDenied) {
      _showGoToSettingsDialog();
    } else {
      print("📛 Unknown permission status: $status");
    }
  }

  void _makeCall(String phone) async {
    final Uri phoneUri = Uri.parse("tel:$phone");
    final bool launched = await launchUrl(phoneUri);
    print(launched ? "✅ Launch success" : "❌ Launch failed");
  }

  void _showRequestPermissionDialog(phone) {
    alertDefualt.dialogPhoneDefault(
      title: "Phone Permission Required",
      body:
          "This app needs phone access to make calls.\nWould you like to allow it?",
      onConfirm: () async {
        Get.back();
        try {
          await permissionHandler.requestPhonePermission();
          await onCall(phone); // Retry if granted
        } on PermissionPhoneException {
          print("❌ User denied phone permission.");
        }
      },
    );
  }

  void _showGoToSettingsDialog() {
    alertDefualt.dialogPhoneDefault(
      title: "Permission Permanently Denied",
      body:
          "Phone permission is permanently denied. Please enable it from app settings.",
      onConfirm: () {
        openAppSettings();
        Get.back();
      },
    );
  }
}
