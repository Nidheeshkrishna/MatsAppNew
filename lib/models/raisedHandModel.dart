// To parse this JSON data, do
//
//     final raisedHandModel = raisedHandModelFromMap(jsonString);

import 'dart:convert';

class RaisedHandModel {
  RaisedHandModel({
    required this.result,
  });

  bool result;

  factory RaisedHandModel.fromJson(String str) =>
      RaisedHandModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RaisedHandModel.fromMap(Map<String, dynamic> json) => RaisedHandModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
