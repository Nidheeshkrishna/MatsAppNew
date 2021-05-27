// To parse this JSON data, do
//
//     final logoImageUploadModel = logoImageUploadModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class LogoImageUploadModel {
  LogoImageUploadModel({
    required this.result,
  });

  int result;

  factory LogoImageUploadModel.fromJson(String str) =>
      LogoImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LogoImageUploadModel.fromMap(Map<String, dynamic> json) =>
      LogoImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
