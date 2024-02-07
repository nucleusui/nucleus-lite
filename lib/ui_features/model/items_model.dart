// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<List<ItemModel>> itemModelFromJson(String str) =>
    List<List<ItemModel>>.from(json
        .decode(str)
        .map((x) => List<ItemModel>.from(x.map((x) => ItemModel.fromJson(x)))));

String itemModelToJson(List<List<ItemModel>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class ItemModel {
  String images;
  String name;

  ItemModel({
    required this.images,
    required this.name,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        images: json["images"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "images": images,
        "name": name,
      };
}
