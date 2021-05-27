// To parse this JSON data, do
//
//     final editBusinessInfoModel = editBusinessInfoModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    required this.result,
  });

  Result result;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "result": result.toMap(),
      };
}

class Result {
  Result({
    required this.phone,
    required this.queryString,
    required this.status,
    required this.apiKey,
  });

  String phone;
  String queryString;
  bool status;
  dynamic apiKey;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        phone: json["phone"],
        queryString: json["queryString"],
        status: json["status"],
        apiKey: json["apiKey"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "queryString": queryString,
        "status": status,
        "apiKey": apiKey,
      };
}
