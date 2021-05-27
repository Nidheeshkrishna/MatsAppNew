// To parse this JSON data, do
//
//     final businessesOfMerchantModel = businessesOfMerchantModelFromMap(jsonString);

import 'dart:convert';

class BusinessesOfMerchantModel {
  BusinessesOfMerchantModel({
    required this.result,
  });

  List<Result> result;

  factory BusinessesOfMerchantModel.fromJson(String str) =>
      BusinessesOfMerchantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessesOfMerchantModel.fromMap(Map<String, dynamic> json) =>
      BusinessesOfMerchantModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.businessId,
    required this.businessName,
  });

  int businessId;
  String businessName;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        businessId: json["BusinessID"],
        businessName: json["BusinessName"],
      );

  Map<String, dynamic> toMap() => {
        "BusinessID": businessId,
        "BusinessName": businessName,
      };
}
