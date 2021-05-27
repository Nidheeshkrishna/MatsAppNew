// To parse this JSON data, do
//
//     final registrationPage = registrationPageFromMap(jsonString);

import 'dart:convert';

class RegistrationModel {
  RegistrationModel({
    required this.userId,
    this.userMobile,
    this.userReferralCode,
    this.status,
    this.userOtp,
    this.userPassword,
    this.queryString,
  });

  int userId;
  dynamic userMobile;
  dynamic userReferralCode;
  dynamic status;
  dynamic userOtp;
  dynamic userPassword;
  dynamic queryString;

  factory RegistrationModel.fromJson(String str) =>
      RegistrationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromMap(Map<String, dynamic> json) =>
      RegistrationModel(
        userId: json["User_ID"],
        userMobile: json["User_Mobile"],
        userReferralCode: json["User_ReferralCode"],
        status: json["Status"],
        userOtp: json["User_OTP"],
        userPassword: json["User_Password"],
        queryString: json["queryString"],
      );

  Map<String, dynamic> toMap() => {
        "User_ID": userId,
        "User_Mobile": userMobile,
        "User_ReferralCode": userReferralCode,
        "Status": status,
        "User_OTP": userOtp,
        "User_Password": userPassword,
        "queryString": queryString,
      };
}
