// To parse this JSON data, do
//
//     final getBusinessOfMerchantModel = getBusinessOfMerchantModelFromMap(jsonString);

import 'dart:convert';

class GetBusinessOfMerchantModel {
  GetBusinessOfMerchantModel({
    required this.result,
  });

  List<Result> result;

  factory GetBusinessOfMerchantModel.fromJson(String str) =>
      GetBusinessOfMerchantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetBusinessOfMerchantModel.fromMap(Map<String, dynamic> json) =>
      GetBusinessOfMerchantModel(
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
