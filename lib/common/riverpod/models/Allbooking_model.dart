// To parse this JSON data, do
//
//     final allBooking = allBookingFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AllBooking allBookingFromJson(String str) =>
    AllBooking.fromJson(json.decode(str));

String allBookingToJson(AllBooking data) => json.encode(data.toJson());

class AllBooking {
  List<Booking>? bookings;

  AllBooking({
    this.bookings,
  });

  factory AllBooking.fromJson(Map<String, dynamic> json) => AllBooking(
        bookings: json["bookings"] == null
            ? []
            : List<Booking>.from(
                json["bookings"]!.map((x) => Booking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookings": bookings == null
            ? []
            : List<dynamic>.from(bookings!.map((x) => x.toJson())),
      };
}

class Booking {
  String? id;
  String? user;
  String? service;
  String? note;
  String? time;
  String? date;
  String? status;
  int? v;

  Booking({
    this.id,
    this.user,
    this.service,
    this.note,
    this.time,
    this.date,
    this.status,
    this.v,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["_id"],
        user: json["user"],
        service: json["service"],
        note: json["note"],
        time: json["time"],
        date: json["date"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "service": service,
        "note": note,
        "time": time,
        "date": date,
        "status": status,
        "__v": v,
      };
}
