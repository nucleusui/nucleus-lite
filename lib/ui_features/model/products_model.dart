// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String namaProduk;
  String hargaProduk;
  List<String> pilihanGambar;
  List<Color> pilihanWarna;
  List<String> pilihanUkuran;
  String deskripsiProduk;

  Product({
    required this.namaProduk,
    required this.hargaProduk,
    required this.pilihanGambar,
    required this.pilihanWarna,
    required this.pilihanUkuran,
    required this.deskripsiProduk,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        namaProduk: json["namaProduk"],
        hargaProduk: json["hargaProduk"],
        pilihanGambar: List<String>.from(json["pilihanGambar"].map((x) => x)),
        pilihanWarna: List<Color>.from(json["pilihanWarna"].map((x) => x)),
        pilihanUkuran: List<String>.from(json["pilihanUkuran"].map((x) => x)),
        deskripsiProduk: json["deskripsiProduk"],
      );

  Map<String, dynamic> toJson() => {
        "namaProduk": namaProduk,
        "hargaProduk": hargaProduk,
        "pilihanGambar": List<dynamic>.from(pilihanGambar.map((x) => x)),
        "pilihanWarna": List<dynamic>.from(pilihanWarna.map((x) => x)),
        "pilihanUkuran": List<dynamic>.from(pilihanUkuran.map((x) => x)),
        "deskripsiProduk": deskripsiProduk,
      };
}
