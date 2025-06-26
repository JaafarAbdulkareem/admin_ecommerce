import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class MessageModel {
  final String title;
  final String body;

  const MessageModel({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() => {
        ApiColumnDb.title: title,
        ApiColumnDb.body: body,
      };
}
