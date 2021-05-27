// To parse this JSON data, do
//
//     final logoImageUploadModel = logoImageUploadModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ShopFrontImageUploadModel {
  ShopFrontImageUploadModel({
    required this.result,
  });

  int result;

  factory ShopFrontImageUploadModel.fromJson(String str) =>
      ShopFrontImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShopFrontImageUploadModel.fromMap(Map<String, dynamic> json) =>
      ShopFrontImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
