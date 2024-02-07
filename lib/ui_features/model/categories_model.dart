// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  String category;

  Categories({
    required this.category,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
      };
}
