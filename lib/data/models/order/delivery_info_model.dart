// class DeliveryInfoModel {
//   final String id;
//   final String name;
//   final String email;
//   final String phone;

//   DeliveryInfoModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//   });

//   factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) {
//     return DeliveryInfoModel(
//       id: json['id'].toString(),
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       phone: json['phone'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'phone': phone,
//     };
//   }
// }
