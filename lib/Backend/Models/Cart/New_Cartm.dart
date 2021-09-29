import 'dart:convert';

import 'package:thrid_ecom/Backend/Models/Product/New_Product_m.dart';

MainCart mainCartFromJson(String str) => MainCart.fromJson(json.decode(str));

String mainCartToJson(MainCart data) => json.encode(data.toJson());

class MainCart {
  List<NewCart> cartData;
  MainCart({required this.cartData});

  factory MainCart.fromJson(Map<String, dynamic> json) => MainCart(
        cartData: List<NewCart>.from(
            json["cartData"].map((x) => NewCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cartData": List<dynamic>.from(cartData.map((x) => x.toJson())),
      };
}

/* -------------------------------------------------------------------------- */
/*                           // ! 1. CART MAIN LIST                           */
/* -------------------------------------------------------------------------- */
NewCart newCartFromJson(String str) => NewCart.fromJson(json.decode(str));

String newCartToJson(NewCart data) => json.encode(data.toJson());

class NewCart {
  NewCart({
    this.id,
    this.quantity,
    this.createdOn,
    this.product,
    this.customerCart,
  });

  String? id;
  int? quantity;
  DateTime? createdOn;
  ProductC? product;
  CustomerCart? customerCart;

  factory NewCart.fromJson(Map<String, dynamic> json) => NewCart(
        id: json["id"],
        quantity: json["quantity"],
        createdOn: DateTime.parse(json["created_on"]),
        product: ProductC.fromJson(json["product"]),
        customerCart: CustomerCart.fromJson(json["customer_cart"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "created_on": createdOn?.toIso8601String(),
        "product": product?.toJson(),
        "customer_cart": customerCart?.toJson(),
      };
}

/* -------------------------------------------------------------------------- */
/*                   // ! 2. CART PAGE FIELD  :- CUSTOMER CART                   */
/* -------------------------------------------------------------------------- */
class CustomerCart {
  CustomerCart({
    this.id,
    this.phone,
    this.fullname,
    this.countryCode,
    this.email,
    this.isCustomer,
  });

  String? id;
  bool? isCustomer;
  String? phone;
  String? fullname;
  int? countryCode;
  String? email;

  factory CustomerCart.fromJson(Map<String, dynamic> json) => CustomerCart(
        id: json["id"],
        phone: json["phone"],
        fullname: json["fullname"],
        countryCode: json["country_code"],
        email: json["email"],
        isCustomer: json["is_customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "fullname": fullname,
        "country_code": countryCode,
        "email": email,
        "is_customer": isCustomer,
      };
}

/* -------------------------------------------------------------------------- */
/*                     // ! 3. CART MODEL FILED :- PRODUCT                    */
/* -------------------------------------------------------------------------- */

// class Product {
//   Product({
//     this.id,
//     this.title,
//     this.description,
//     this.salesPrice,
//     this.discountPrice,
//     this.ourPrice,
//     this.category,
//     this.date,
//     this.stock,
//     this.pic,
//     this.offers,
//     this.uplod,
//   });

//   String? id;
//   String? title;
//   String? description;
//   int? salesPrice;
//   int? discountPrice;
//   int? ourPrice;
//   String? category;
//   DateTime? date;
//   int? stock;
//   String? pic;
//   int? offers;
//   String? uplod;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         salesPrice: json["sales_price"],
//         discountPrice: json["discount_price"],
//         ourPrice: json["our_price"],
//         category: json["category"],
//         date: DateTime.parse(json["date"]),
//         stock: json["stock"],
//         pic: json["pic"],
//         offers: json["offers"],
//         uplod: json["uplod"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "sales_price": salesPrice,
//         "discount_price": discountPrice,
//         "our_price": ourPrice,
//         "category": category,
//         "date": date?.toIso8601String(),
//         "stock": stock,
//         "pic": pic,
//         "offers": offers,
//         "uplod": uplod,
//       };
// }
