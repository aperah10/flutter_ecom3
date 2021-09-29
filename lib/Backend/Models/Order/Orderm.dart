// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

MainOrder mainOrderFromJson(String str) => MainOrder.fromJson(json.decode(str));

String mainOrderToJson(MainOrder data) => json.encode(data.toJson());

class MainOrder {
  List<Order> orderData;
  MainOrder({required this.orderData});

  factory MainOrder.fromJson(Map<String, dynamic> json) => MainOrder(
        orderData:
            List<Order>.from(json["orderData"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderData": List<dynamic>.from(orderData.map((x) => x.toJson())),
      };
}

/* -------------------------------------------------------------------------- */
/*                            // ! ORDER CLASS PAGE                           */
/* -------------------------------------------------------------------------- */

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.id,
    this.quantity,
    this.ammount,
    this.shipPrice,
    this.totalAmmount,
    this.status,
    this.user,
    this.product,
    this.address,
  });

  final String? id;
  final int? quantity;
  final int? ammount;

  final int? shipPrice;
  final int? totalAmmount;
  final String? status;
  final String? user;
  final String? product;
  final String? address;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        quantity: json["quantity"],
        ammount: json["ammount"],
        shipPrice: json["shipPrice"],
        totalAmmount: json["totalAmmount"],
        status: json["status"],
        user: json["user"],
        product: json["product"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "ammount": ammount,
        "shipPrice": shipPrice,
        "totalAmmount": totalAmmount,
        "status": status,
        "user": user,
        "product": product,
        "address": address,
      };
}
