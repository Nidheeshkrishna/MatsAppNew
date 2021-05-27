// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromMap(jsonString);

import 'dart:convert';

class GetCategoryModel {
  GetCategoryModel({
    required this.result,
  });

  List<ResultCategory> result;

  factory GetCategoryModel.fromJson(String str) =>
      GetCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCategoryModel.fromMap(Map<String, dynamic> json) =>
      GetCategoryModel(
        result: List<ResultCategory>.from(
            json["result"].map((x) => ResultCategory.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class ResultCategory {
  ResultCategory({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryFind,
  });

  int id;
  String categoryName;
  String categoryImage;
  dynamic categoryFind;

  factory ResultCategory.fromJson(String str) =>
      ResultCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCategory.fromMap(Map<String, dynamic> json) => ResultCategory(
        id: json["Id"],
        categoryName: json["CategoryName"],
        categoryImage: json["CategoryImage"],
        categoryFind:
            json["CategoryFind"] == null ? null : json["CategoryFind"],
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "CategoryName": categoryName,
        "CategoryImage": categoryImage,
        "CategoryFind": categoryFind == null ? null : categoryFind,
      };
}
