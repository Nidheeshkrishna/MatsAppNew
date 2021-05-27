// To parse this JSON data, do
//
//     final redeemRequestModel = redeemRequestModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RedeemRequestModel {
  RedeemRequestModel({
    required this.result,
  });

  List<Result> result;

  factory RedeemRequestModel.fromJson(String str) =>
      RedeemRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedeemRequestModel.fromMap(Map<String, dynamic> json) =>
      RedeemRequestModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.couponCode,
    required this.billingAmount,
    required this.discount,
    required this.couponValue,
    required this.name,
    required this.contactNumber,
    required this.transactionId,
    required this.logoUrl,
    required this.validDate,
  });

  String couponCode;
  String billingAmount;
  String discount;
  String couponValue;
  dynamic name;
  String contactNumber;
  int transactionId;
  String logoUrl;
  String validDate;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        couponCode: json["CouponCode"],
        billingAmount: json["BillingAmount"],
        discount: json["Discount"],
        couponValue: json["CouponValue"],
        name: json["Name"] == null ? null : json["Name"],
        contactNumber: json["ContactNumber"],
        transactionId: json["TransactionID"],
        logoUrl: json["LogoURL"],
        validDate: json["validDate"],
      );

  Map<String, dynamic> toMap() => {
        "CouponCode": couponCode,
        "BillingAmount": billingAmount,
        "Discount": discount,
        "CouponValue": couponValue,
        "Name": name == null ? null : name,
        "ContactNumber": contactNumber,
        "TransactionID": transactionId,
        "LogoURL": logoUrl,
        "validDate": validDate,
      };
}
