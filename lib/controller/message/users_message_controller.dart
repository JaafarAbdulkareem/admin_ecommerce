import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UsersMessageController extends GetxController {}

class UsersMessageControllerImp extends UsersMessageController {
  late StatusRequest statusRequest;
  late TextEditingController title;
  late TextEditingController body;
  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    title = TextEditingController();
    body = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }
}
