// To parse this JSON data, do
//
//     final otpModel = otpModelFromMap(jsonString);

// To parse this JSON data, do
//
//     final getstatusOfOtpModel = getstatusOfOtpModelFromMap(jsonString);

import 'dart:convert';

class GetstatusOfOtpModel {
  GetstatusOfOtpModel({
    required this.status,
  });

  bool status;

  factory GetstatusOfOtpModel.fromJson(String str) =>
      GetstatusOfOtpModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetstatusOfOtpModel.fromMap(Map<String, dynamic> json) =>
      GetstatusOfOtpModel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
