// To parse this JSON data, do
//
//     final alreadyRegistrationPage = alreadyRegistrationPageFromMap(jsonString);

import 'dart:convert';

class AlreadyRegistredModel {
  AlreadyRegistredModel({
    required this.result,
  });

  bool result;

  factory AlreadyRegistredModel.fromJson(String str) =>
      AlreadyRegistredModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlreadyRegistredModel.fromMap(Map<String, dynamic> json) =>
      AlreadyRegistredModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
