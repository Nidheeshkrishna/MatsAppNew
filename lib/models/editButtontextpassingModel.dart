// To parse this JSON data, do
//
//     final editBusinessInfoModel = editBusinessInfoModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class EditBusinessInfoModel {
  EditBusinessInfoModel({
    required this.result,
    required this.businessId,
    required this.apikeyStatus,
  });

  bool result;
  int businessId;
  bool apikeyStatus;

  factory EditBusinessInfoModel.fromJson(String str) =>
      EditBusinessInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditBusinessInfoModel.fromMap(Map<String, dynamic> json) =>
      EditBusinessInfoModel(
        result: json["result"],
        businessId: json["BusinessID"],
        apikeyStatus: json["apikey_status"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "BusinessID": businessId,
        "apikey_status": apikeyStatus,
      };
}
