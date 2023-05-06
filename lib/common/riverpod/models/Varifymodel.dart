// To parse this JSON data, do
//
//     final verify = verifyFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

Verify verifyFromJson(String str) => Verify.fromJson(json.decode(str));

String verifyToJson(Verify data) => json.encode(data.toJson());

class Verify {
  String? id;

  Verify({
    this.id,
  });

  factory Verify.fromJson(Map<String, dynamic> json) => Verify(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
