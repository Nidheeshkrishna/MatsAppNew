// To parse this JSON data, do
//
//     final logoImageUploadModel = logoImageUploadModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AdharCardImageUploadModel {
  AdharCardImageUploadModel({
    required this.result,
  });

  int result;

  factory AdharCardImageUploadModel.fromJson(String str) =>
      AdharCardImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdharCardImageUploadModel.fromMap(Map<String, dynamic> json) =>
      AdharCardImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
