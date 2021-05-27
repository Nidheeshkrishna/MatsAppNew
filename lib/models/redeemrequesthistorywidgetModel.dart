// To parse this JSON data, do
//
//     final getStaffListModel = getStaffListModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RedeemRequestHistoryModel {
  RedeemRequestHistoryModel({
    required this.result,
  });

  List<Result> result;

  factory RedeemRequestHistoryModel.fromJson(String str) =>
      RedeemRequestHistoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedeemRequestHistoryModel.fromMap(Map<String, dynamic> json) =>
      RedeemRequestHistoryModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.customerName,
    required this.customerMobile,
    required this.transactionDate,
    required this.status,
    required this.discount,
    required this.couponValue,
  });

  dynamic customerName;
  String customerMobile;
  String transactionDate;
  dynamic status;
  String discount;
  String couponValue;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        customerName:
            json["CustomerName"] == null ? null : json["CustomerName"],
        customerMobile: json["CustomerMobile"],
        transactionDate: json["TransactionDate"],
        status: json["status"] == null ? null : json["status"],
        discount: json["Discount"],
        couponValue: json["CouponValue"],
      );

  Map<String, dynamic> toMap() => {
        "CustomerName": customerName == null ? null : customerName,
        "CustomerMobile": customerMobile,
        "TransactionDate": transactionDate,
        "status": status == null ? null : status,
        "Discount": discount,
        "CouponValue": couponValue,
      };
}
