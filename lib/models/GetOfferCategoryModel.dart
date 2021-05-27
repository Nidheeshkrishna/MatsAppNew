// To parse this JSON data, do
//
//     final getOfferCategoryModel = getOfferCategoryModelFromMap(jsonString);

import 'dart:convert';

class GetOfferCategoryModel {
  GetOfferCategoryModel({
    required this.result,
  });

  List<Result> result;

  factory GetOfferCategoryModel.fromJson(String str) =>
      GetOfferCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetOfferCategoryModel.fromMap(Map<String, dynamic> json) =>
      GetOfferCategoryModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.offerCategoryId,
    required this.offerCategoryName,
  });

  int offerCategoryId;
  String offerCategoryName;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        offerCategoryId: json["OfferCategory_ID"],
        offerCategoryName: json["OfferCategory_Name"],
      );

  Map<String, dynamic> toMap() => {
        "OfferCategory_ID": offerCategoryId,
        "OfferCategory_Name": offerCategoryName,
      };
}
