import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

final AlertDefault _alertDefualt = AlertDefault();

Future<void> onEmailSend(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: _encodeQueryParameters(<String, String>{
      'subject': KeyLanguage.emailSubjectDeliveryInquiry.tr,
      'body': KeyLanguage.emailBodyDeliveryInquiry.tr,
    }),
  );

  if (await canLaunchUrl(emailUri)) {
    final bool launched = await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    );
    debugPrint(launched ? "✅ Email launched" : "❌ Email launch failed");
  } else {
    _showEmailLaunchErrorDialog();
  }
}

String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void _showEmailLaunchErrorDialog() {
  _alertDefualt.dialogDefault(
    title: KeyLanguage.alertEmailAppTitle.tr,
    body: KeyLanguage.alertEmailAppBody.tr,
  );
}
