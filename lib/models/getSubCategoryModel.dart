// To parse this JSON data, do
//
//     final getsubCategoryModel = getsubCategoryModelFromMap(jsonString);

import 'dart:convert';

class GetsubCategoryModel {
  GetsubCategoryModel({
    required this.result,
  });

  List<ResultsubCategory> result;

  factory GetsubCategoryModel.fromJson(String str) =>
      GetsubCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetsubCategoryModel.fromMap(Map<String, dynamic> json) =>
      GetsubCategoryModel(
        result: List<ResultsubCategory>.from(
            json["result"].map((x) => ResultsubCategory.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class ResultsubCategory {
  ResultsubCategory({
    required this.bscId,
    required this.bscSubCatgName,
    required this.bscCatgId,
  });

  int bscId;
  String bscSubCatgName;
  int bscCatgId;

  factory ResultsubCategory.fromJson(String str) =>
      ResultsubCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultsubCategory.fromMap(Map<String, dynamic> json) =>
      ResultsubCategory(
        bscId: json["BSC_Id"],
        bscSubCatgName: json["BSC_SubCatgName"],
        bscCatgId: json["BSC_CatgId"],
      );

  Map<String, dynamic> toMap() => {
        "BSC_Id": bscId,
        "BSC_SubCatgName": bscSubCatgName,
        "BSC_CatgId": bscCatgId,
      };
}
