// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  String name;
  String avatar;
  List<Position> position;

  Search({
    required this.name,
    required this.avatar,
    required this.position,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        name: json["name"],
        avatar: json["avatar"],
        position: List<Position>.from(
            json["position"].map((x) => Position.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "position": List<dynamic>.from(position.map((x) => x.toJson())),
      };
}

class Position {
  String name;

  Position({
    required this.name,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
