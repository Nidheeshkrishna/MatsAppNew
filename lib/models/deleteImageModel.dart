// To parse this JSON data, do
//
//     final deleteImageModel = deleteImageModelFromMap(jsonString);

import 'dart:convert';

class DeleteImageModel {
  DeleteImageModel({
    required this.result,
  });

  int result;

  factory DeleteImageModel.fromJson(String str) =>
      DeleteImageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteImageModel.fromMap(Map<String, dynamic> json) =>
      DeleteImageModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
