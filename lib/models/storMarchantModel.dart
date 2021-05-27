// To parse this JSON data, do
//
//     final getStoreModel = getStoreModelFromMap(jsonString);

import 'dart:convert';

class GetStoreModel {
  GetStoreModel({
    required this.result,
  });

  List<Result> result;

  factory GetStoreModel.fromJson(String str) =>
      GetStoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetStoreModel.fromMap(Map<String, dynamic> json) => GetStoreModel(
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
    required this.businessAddress,
    required this.businessLogo,
  });

  int businessId;
  String businessName;
  String businessAddress;
  String businessLogo;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        businessId: json["BusinessID"],
        businessName: json["BusinessName"],
        businessAddress: json["BusinessAddress"],
        businessLogo: json["BusinessLogo"],
      );

  Map<String, dynamic> toMap() => {
        "BusinessID": businessId,
        "BusinessName": businessName,
        "BusinessAddress": businessAddress,
        "BusinessLogo": businessLogo,
      };
}
