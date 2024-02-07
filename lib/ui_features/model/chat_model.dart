// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  String image;
  String tipe;
  String message;
  int status;

  ChatModel({
    required this.image,
    required this.tipe,
    required this.message,
    required this.status,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        image: json["image"],
        tipe: json["tipe"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "tipe": tipe,
        "message": message,
        "status": status,
      };
}
