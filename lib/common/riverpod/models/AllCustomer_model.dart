// To parse this JSON data, do
//
//     final allCustomer = allCustomerFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AllCustomer allCustomerFromJson(String str) =>
    AllCustomer.fromJson(json.decode(str));

String allCustomerToJson(AllCustomer data) => json.encode(data.toJson());

class AllCustomer {
  List<Customer>? customers;

  AllCustomer({
    this.customers,
  });

  factory AllCustomer.fromJson(Map<String, dynamic> json) => AllCustomer(
        customers: json["customers"] == null
            ? []
            : List<Customer>.from(
                json["customers"]!.map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customers": customers == null
            ? []
            : List<dynamic>.from(customers!.map((x) => x.toJson())),
      };
}

class Customer {
  String? id;
  String? email;
  String? password;
  String? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? picture;
  int? v;
  List<dynamic>? ratings;

  Customer({
    this.id,
    this.email,
    this.password,
    this.role,
    this.verified,
    this.cordinates,
    this.phone,
    this.address,
    this.fullName,
    this.picture,
    this.v,
    this.ratings,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        verified: json["verified"],
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        picture: json["picture"],
        v: json["__v"],
        ratings: json["ratings"] == null
            ? []
            : List<dynamic>.from(json["ratings"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "role": role,
        "verified": verified,
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "picture": picture,
        "__v": v,
        "ratings":
            ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
      };
}
