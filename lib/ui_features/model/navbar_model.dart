import 'dart:convert';

List<NavbarModel> navbarModelFromJson(String str) => List<NavbarModel>.from(
    json.decode(str).map((x) => NavbarModel.fromJson(x)));

String navbarModelToJson(List<NavbarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NavbarModel {
  String? icon;
  String? title;
  bool status;

  NavbarModel({
    this.icon,
    this.title,
    this.status = false,
  });

  factory NavbarModel.fromJson(Map<String, dynamic> json) => NavbarModel(
        icon: json["icon"],
        title: json["title"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "status": status,
      };
}
