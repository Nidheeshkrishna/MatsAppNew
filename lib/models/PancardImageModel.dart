// To parse this JSON data, do
//
//     final logoImageUploadModel = logoImageUploadModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PanCardImageUploadModel {
  PanCardImageUploadModel({
    required this.result,
  });

  int result;

  factory PanCardImageUploadModel.fromJson(String str) =>
      PanCardImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PanCardImageUploadModel.fromMap(Map<String, dynamic> json) =>
      PanCardImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
