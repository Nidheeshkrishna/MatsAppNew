// To parse this JSON data, do
//
//     final logoImageUploadModel = logoImageUploadModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CoverImageUploadModel {
  CoverImageUploadModel({
    required this.result,
  });

  int result;

  factory CoverImageUploadModel.fromJson(String str) =>
      CoverImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoverImageUploadModel.fromMap(Map<String, dynamic> json) =>
      CoverImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
