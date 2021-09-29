import 'dart:convert';

MainProduct mainProductMFromJson(String str) =>
    MainProduct.fromJson(json.decode(str));

String mainProductMToJson(MainProduct data) => json.encode(data.toJson());

class MainProduct {
  MainProduct({
    required this.productData,
  });

  List<ProductC> productData;

  // factory MainProductM.fromJson(Map<String, dynamic> json) => MainProductM(
  //     data: List<ProductM>.from(json["data"].map((x) => ProductM.fromJson(x))),
  // );
  factory MainProduct.fromJson(Map<String, dynamic> json) => MainProduct(
        productData: List<ProductC>.from(
            json["productData"].map((x) => ProductC.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productData": List<dynamic>.from(productData.map((x) => x.toJson())),
      };
}

/* -------------------------------------------------------------------------- */
/*                        // ! PRODUCT MODEL WITH DEPTH                       */
/* -------------------------------------------------------------------------- */

// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

class ProductC {
  ProductC({
    this.id,
    this.title,
    this.description,
    this.salesPrice,
    this.discountPrice,
    this.ourPrice,
    this.category,
    this.date,
    this.stock,
    this.pic,
    this.offers,
    this.uplod,
  });

  String? id;
  String? title;
  String? description;
  int? salesPrice;
  int? discountPrice;
  int? ourPrice;
  String? category;
  DateTime? date;
  int? stock;
  String? pic;
  int? offers;
  Uplod? uplod;

  factory ProductC.fromJson(Map<String, dynamic> json) => ProductC(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        salesPrice: json["sales_price"],
        discountPrice: json["discount_price"],
        ourPrice: json["our_price"],
        category: json["category"],
        date: DateTime.parse(json["date"]),
        stock: json["stock"],
        pic: json["pic"],
        offers: json["offers"],
        uplod: Uplod.fromJson(json["uplod"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "sales_price": salesPrice,
        "discount_price": discountPrice,
        "our_price": ourPrice,
        "category": category,
        "date": date?.toIso8601String(),
        "stock": stock,
        "pic": pic,
        "offers": offers,
        "uplod": uplod?.toJson(),
      };
}

class Uplod {
  Uplod({
    this.id,
    this.phone,
    this.fullname,
    this.countryCode,
    this.email,
  });

  String? id;
  String? phone;
  String? fullname;
  int? countryCode;
  String? email;

  factory Uplod.fromJson(Map<String, dynamic> json) => Uplod(
        id: json["id"],
        phone: json["phone"],
        fullname: json["fullname"],
        countryCode: json["country_code"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "fullname": fullname,
        "country_code": countryCode,
      };
}
