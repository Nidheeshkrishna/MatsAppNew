// To parse this JSON data, do
//
//     final getOfferSubCatModel = getOfferSubCatModelFromMap(jsonString);

import 'dart:convert';

class GetOfferSubCatModel {
  GetOfferSubCatModel({
    required this.result,
  });

  List<Result> result;

  factory GetOfferSubCatModel.fromJson(String str) =>
      GetOfferSubCatModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetOfferSubCatModel.fromMap(Map<String, dynamic> json) =>
      GetOfferSubCatModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.ofrscId,
    required this.ofrscSubCatgName,
    required this.ofrscCatgId,
  });

  int ofrscId;
  String ofrscSubCatgName;
  int ofrscCatgId;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        ofrscId: json["OFRSC_Id"],
        ofrscSubCatgName: json["OFRSC_SubCatgName"],
        ofrscCatgId: json["OFRSC_CatgId"],
      );

  Map<String, dynamic> toMap() => {
        "OFRSC_Id": ofrscId,
        "OFRSC_SubCatgName": ofrscSubCatgName,
        "OFRSC_CatgId": ofrscCatgId,
      };
}
