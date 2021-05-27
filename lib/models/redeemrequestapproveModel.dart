// To parse this JSON data, do
//
//     final getStaffListModel = getStaffListModelFromMap(jsonString);

import 'dart:convert';

class RedeemRequestApproveModel {
  RedeemRequestApproveModel({
    required this.result,
  });

  int result;

  factory RedeemRequestApproveModel.fromJson(String str) =>
      RedeemRequestApproveModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedeemRequestApproveModel.fromMap(Map<String, dynamic> json) =>
      RedeemRequestApproveModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
