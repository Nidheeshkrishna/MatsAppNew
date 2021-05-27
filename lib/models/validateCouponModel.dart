// To parse this JSON data, do
//
//     final validateCouponModel = validateCouponModelFromMap(jsonString);

import 'dart:convert';

class ValidateCouponModel {
  ValidateCouponModel({
    required this.result,
  });

  int result;

  factory ValidateCouponModel.fromJson(String str) =>
      ValidateCouponModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidateCouponModel.fromMap(Map<String, dynamic> json) =>
      ValidateCouponModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
