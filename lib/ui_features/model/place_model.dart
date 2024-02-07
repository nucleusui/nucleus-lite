// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

List<Place> placeFromJson(String str) =>
    List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placeToJson(List<Place> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
  String title;
  String subtitle;
  int price;
  String time;
  double rating;
  String images;

  Place({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.time,
    required this.rating,
    required this.images,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        title: json["title"],
        subtitle: json["subtitle"],
        price: json["price"],
        time: json["time"],
        rating: json["rating"]?.toDouble(),
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "price": price,
        "time": time,
        "rating": rating,
        "images": images,
      };
}
