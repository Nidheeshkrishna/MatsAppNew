// To parse this JSON data, do
//
//     final getStaffListModel = getStaffListModelFromMap(jsonString);

import 'dart:convert';

class RedeemRequestDeclineModel {
  RedeemRequestDeclineModel({
    required this.result,
  });

  int result;

  factory RedeemRequestDeclineModel.fromJson(String str) =>
      RedeemRequestDeclineModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedeemRequestDeclineModel.fromMap(Map<String, dynamic> json) =>
      RedeemRequestDeclineModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
