import 'package:admin_ecommerce/core/constant/api_column_db.dart';

class OrderModel {
  final String id;
  final int typePayment;
  final int typeDelivery;
  final double deliveryPrice;
  final double price;
  final double totalPrice;
  late int status;
  final String userId;
  final String? addressId;
  final String? couponsId;

  /// These may return null from the DB view when `typeDelivery = 0`
  final String? name;
  final String? email;
  final String? phone;

  OrderModel({
    required this.id,
    required this.typePayment,
    required this.typeDelivery,
    required this.deliveryPrice,
    required this.price,
    required this.totalPrice,
    required this.status,
    required this.userId,
    this.addressId,
    this.couponsId,
    this.name,
    this.email,
    this.phone,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json[ApiColumnDb.id].toString(),
        typePayment: int.parse(json[ApiColumnDb.typePayment].toString()),
        typeDelivery: int.parse(json[ApiColumnDb.typeDelivery].toString()),
        deliveryPrice: double.parse(json[ApiColumnDb.deliveryPrice].toString()),
        price: double.parse(json[ApiColumnDb.price].toString()),
        totalPrice: double.parse(json[ApiColumnDb.totalPrice].toString()),
        status: int.parse(json[ApiColumnDb.status].toString()),
        userId: json[ApiColumnDb.userId].toString(),
        addressId: json[ApiColumnDb.addressId]?.toString(),
        couponsId: json[ApiColumnDb.couponsId]?.toString(),
        name: json[ApiColumnDb.username]?.toString(),
        email: json[ApiColumnDb.email]?.toString(),
        phone: json[ApiColumnDb.phone]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.id: id,
        ApiColumnDb.typePayment: typePayment,
        ApiColumnDb.typeDelivery: typeDelivery,
        ApiColumnDb.deliveryPrice: deliveryPrice,
        ApiColumnDb.price: price,
        ApiColumnDb.totalPrice: totalPrice,
        ApiColumnDb.status: status,
        ApiColumnDb.userId: userId,
        ApiColumnDb.addressId: addressId,
        ApiColumnDb.couponsId: couponsId,
        ApiColumnDb.username: name,
        ApiColumnDb.email: email,
        ApiColumnDb.phone: phone,
      };
}

// import 'package:admin_ecommerce/core/constant/api_column_db.dart';

// class OrderModel {
//   late String id;
//   final int typePayment;
//   final int typeDelivery;
//   final double deliveryPrice;
//   final double price;
//   final double totalPrice;
//   late int status;
//   final String userId;
//   final String? addressId;
//   final String? couponsId;

//   OrderModel({
//     required this.id,
//     required this.typePayment,
//     required this.typeDelivery,
//     required this.deliveryPrice,
//     required this.price,
//     required this.totalPrice,
//     required this.status,
//     required this.userId,
//     this.addressId,
//     this.couponsId,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         id: json[ApiColumnDb.id].toString(),
//         typePayment: int.parse(json[ApiColumnDb.typePayment].toString()),
//         typeDelivery: int.parse(json[ApiColumnDb.typeDelivery].toString()),
//         deliveryPrice: double.parse(json[ApiColumnDb.deliveryPrice].toString()),
//         price: double.parse(json[ApiColumnDb.price].toString()),
//         totalPrice: double.parse(json[ApiColumnDb.totalPrice].toString()),
//         status: int.parse(json[ApiColumnDb.status].toString()),
//         userId: json[ApiColumnDb.userId].toString(),
//         addressId: json[ApiColumnDb.addressId]?.toString(),
//         couponsId: json[ApiColumnDb.couponsId]?.toString(),
//       );

//   Map<String, dynamic> toJson() => {
//         ApiColumnDb.id: id,
//         ApiColumnDb.typePayment: typePayment,
//         ApiColumnDb.typeDelivery: typeDelivery,
//         ApiColumnDb.deliveryPrice: deliveryPrice,
//         ApiColumnDb.price: price,
//         ApiColumnDb.totalPrice: totalPrice,
//         ApiColumnDb.userId: userId,
//         ApiColumnDb.addressId: addressId,
//         ApiColumnDb.couponsId: couponsId,
//         ApiColumnDb.status: status,
//       };
// }
