import 'package:admin_ecommerce/core/constant/api_column_db.dart';
import 'package:get/get.dart';

class DeliveryInfoModel {
  final String id;
  final String username;
  final String age;
  final String email;
  final String password;
  final String phone;
  final RxBool active; // ✅ Changed to observable

  DeliveryInfoModel({
    required this.id,
    required this.username,
    required this.age,
    required this.email,
    required this.password,
    required this.phone,
    required bool active,
  }) : active = RxBool(active); // initialize RxBool
  
  factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) {
    return DeliveryInfoModel(
      id: json[ApiColumnDb.id].toString(),
      username: json[ApiColumnDb.username],
      age: json[ApiColumnDb.age].toString(),
      email: json[ApiColumnDb.email],
      password: json[ApiColumnDb.password],
      phone: json[ApiColumnDb.phone].toString(),
      active:
          json[ApiColumnDb.active] == "1" || json[ApiColumnDb.active] == true,
    );
  }
}

// import 'package:admin_ecommerce/core/constant/api_column_db.dart';

// class DeliveryInfoModel {
//   final String id;
//   final String username;
//   final String age;
//   final String email;
//   final String password;
//   final String phone;
//   late bool active;

//    DeliveryInfoModel({
//     required this.id,
//     required this.username,
//     required this.age,
//     required this.email,
//     required this.password,
//     required this.phone,
//     required this.active,
//   });

  // factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) {
  //   return DeliveryInfoModel(
  //     id: json[ApiColumnDb.id].toString(),
  //     username: json[ApiColumnDb.username],
  //     age: json[ApiColumnDb.age].toString(),
  //     email: json[ApiColumnDb.email],
  //     password: json[ApiColumnDb.password],
  //     phone: json[ApiColumnDb.phone].toString(),
  //     active: json[ApiColumnDb.active] == "1" || json[ApiColumnDb.active] == true,
  //   );
  // }


// }
