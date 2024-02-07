// To parse this JSON data, do
//
//     final sortModel = sortModelFromJson(jsonString);

import 'dart:convert';

List<SortModel> sortModelFromJson(String str) =>
    List<SortModel>.from(json.decode(str).map((x) => SortModel.fromJson(x)));

String sortModelToJson(List<SortModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SortModel {
  String name;
  bool status;

  SortModel({
    required this.name,
    required this.status,
  });

  factory SortModel.fromJson(Map<String, dynamic> json) => SortModel(
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
