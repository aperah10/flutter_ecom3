import 'dart:convert';

MainAddress mainAddressMFromJson(String str) =>
    MainAddress.fromJson(json.decode(str));

String mainAddressMToJson(MainAddress data) => json.encode(data.toJson());

class MainAddress {
  MainAddress({
    required this.addressData,
  });

  List<Address> addressData;

  factory MainAddress.fromJson(Map<String, dynamic> json) => MainAddress(
        addressData: List<Address>.from(
            json["addressData"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addressData": List<dynamic>.from(addressData.map((x) => x.toJson())),
      };
}

/* -------------------------------------------------------------------------- */
/*                 // orc 1.  ADDRESS PAGE MODEL  IN WITHOUT LIST                */
/* -------------------------------------------------------------------------- */

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.id,
    this.fullname,
    this.phone,
    this.email,
    this.house,
    this.trade,
    this.area,
    this.city,
    this.pinCode,
    this.delTime,
    this.state,
    this.uplod,
  });

  final String? id;
  final String? fullname;
  final String? phone;
  final String? email;
  final String? house;
  final String? trade;
  final String? area;
  final String? city;
  // final int? pinCode;
  final String? pinCode;
  final String? delTime;
  final String? state;
  final String? uplod;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        house: json["house"],
        trade: json["trade"],
        area: json["area"],
        city: json["city"],
        pinCode: json["pinCode"],
        delTime: json["delTime"],
        state: json["state"],
        uplod: json["uplod"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "house": house,
        "trade": trade,
        "area": area,
        "city": city,
        "pinCode": pinCode,
        "delTime": delTime,
        "state": state,
        "uplod": uplod,
      };
}
