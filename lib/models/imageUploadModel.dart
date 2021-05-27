// To parse this JSON data, do
//
//     final imageUploadModel = imageUploadModelFromMap(jsonString);

import 'dart:convert';

class ImageUploadModel {
  ImageUploadModel({
    required this.result,
  });

  int result;

  factory ImageUploadModel.fromJson(String str) =>
      ImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageUploadModel.fromMap(Map<String, dynamic> json) =>
      ImageUploadModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
