// To parse this JSON data, do
//
//     final declineModel = declineModelFromMap(jsonString);

import 'dart:convert';

class DeclineModel {
  DeclineModel({
    required this.result,
  });

  bool result;

  factory DeclineModel.fromJson(String str) =>
      DeclineModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeclineModel.fromMap(Map<String, dynamic> json) => DeclineModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
