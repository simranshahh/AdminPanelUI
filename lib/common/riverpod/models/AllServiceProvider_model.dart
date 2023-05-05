// To parse this JSON data, do
//
//     final allSeviceProvider = allSeviceProviderFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AllSeviceProvider allSeviceProviderFromJson(String str) => AllSeviceProvider.fromJson(json.decode(str));

String allSeviceProviderToJson(AllSeviceProvider data) => json.encode(data.toJson());

class AllSeviceProvider {
    List<SProvider>? providers;

    AllSeviceProvider({
        this.providers,
    });

    factory AllSeviceProvider.fromJson(Map<String, dynamic> json) => AllSeviceProvider(
        providers: json["providers"] == null ? [] : List<SProvider>.from(json["providers"]!.map((x) => SProvider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "providers": providers == null ? [] : List<dynamic>.from(providers!.map((x) => x.toJson())),
    };
}

class SProvider {
    String? id;
    String? email;
    String? password;
    String? role;
    bool? verified;
    String? picture;
    int? v;
    List<Rating>? ratings;
    String? cordinates;
    String? phone;
    String? address;
    String? fullName;
    String? price;
    String? refreshTokens;

    SProvider({
        this.id,
        this.email,
        this.password,
        this.role,
        this.verified,
        this.picture,
        this.v,
        this.ratings,
        this.cordinates,
        this.phone,
        this.address,
        this.fullName,
        this.price,
        this.refreshTokens,
    });

    factory SProvider.fromJson(Map<String, dynamic> json) => SProvider(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        verified: json["verified"],
        picture: json["picture"],
        v: json["__v"],
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        price: json["price"],
        refreshTokens: json["refreshTokens"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "role": role,
        "verified": verified,
        "picture": picture,
        "__v": v,
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "price": price,
        "refreshTokens": refreshTokens,
    };
}

class Rating {
    String? user;
    String? description;
    String? id;

    Rating({
        this.user,
        this.description,
        this.id,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        user: json["user"],
        description: json["description"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "description": description,
        "_id": id,
    };
}
