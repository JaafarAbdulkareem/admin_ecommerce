import 'package:permission_handler/permission_handler.dart';

class RequestPermission {
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) throw PermissionCameraException();
  }

  Future<void> requestPhonePermission() async {
    final status = await Permission.phone.request();
    if (!status.isGranted) throw PermissionPhoneException();
  }
}

class PermissionCameraException implements Exception {}

class PermissionPhoneException implements Exception {}
