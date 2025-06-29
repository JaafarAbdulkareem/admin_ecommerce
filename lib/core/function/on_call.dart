import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/request_permission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

final RequestPermission _permissionHandler = RequestPermission();
final AlertDefault _alertDefualt = AlertDefault();

Future<void> onPhoneCall(String phone) async {
  final status = await Permission.phone.status;

  if (status.isGranted) {
    _makeCall(phone);
  } else if (status.isDenied) {
    _showRequestPermissionDialog(phone);
  } else if (status.isPermanentlyDenied) {
    _showGoToSettingsDialog();
  } else {
    debugPrint("📛 Unknown permission status: $status");
  }
}

void _makeCall(String phone) async {
  final Uri phoneUri = Uri.parse("tel:$phone");
  final bool launched = await launchUrl(phoneUri);
  debugPrint(launched ? "✅ Launch success" : "❌ Launch failed");
}

void _showRequestPermissionDialog(phone) {
  _alertDefualt.dialogPhoneDefault(
    title: "Phone Permission Required",
    body:
        "This app needs phone access to make calls.\nWould you like to allow it?",
    onConfirm: () async {
      Get.back();
      try {
        await _permissionHandler.requestPhonePermission();
        await onPhoneCall(phone); // Retry if granted
      } on PermissionPhoneException {
        debugPrint("❌ User denied phone permission.");
      }
    },
  );
}

void _showGoToSettingsDialog() {
  _alertDefualt.dialogPhoneDefault(
    title: "Permission Permanently Denied",
    body:
        "Phone permission is permanently denied. Please enable it from app settings.",
    onConfirm: () {
      openAppSettings();
      Get.back();
    },
  );
}
