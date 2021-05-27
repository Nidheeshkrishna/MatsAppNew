// To parse this JSON data, do
//
//     final getImageModel = getImageModelFromMap(jsonString);

import 'dart:convert';

class GetImageModel {
  GetImageModel({
    required this.result,
  });

  List<Result> result;

  factory GetImageModel.fromJson(String str) =>
      GetImageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetImageModel.fromMap(Map<String, dynamic> json) => GetImageModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.imgId,
    this.imgName,
    required this.imgUrl,
    required this.imgBusinessId,
    this.imgCategory,
    required this.imgDocType,
    required this.imgStatus,
    required this.imgCreatedDate,
    required this.imgLastUpdatedDate,
    this.imgCreatedBy,
    this.imgLastUpdatedBy,
    required this.imgState,
    required this.imgDistrict,
    required this.imgTown,
    this.imgVerify,
  });

  int imgId;
  dynamic imgName;
  String imgUrl;
  int imgBusinessId;
  dynamic imgCategory;
  String imgDocType;
  String imgStatus;
  String imgCreatedDate;
  String imgLastUpdatedDate;
  dynamic imgCreatedBy;
  dynamic imgLastUpdatedBy;
  String imgState;
  String imgDistrict;
  String imgTown;
  dynamic imgVerify;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        imgId: json["Img_ID"],
        imgName: json["Img_Name"],
        imgUrl: json["Img_Url"],
        imgBusinessId: json["Img_BusinessID"],
        imgCategory: json["Img_Category"],
        imgDocType: json["Img_DocType"],
        imgStatus: json["Img_Status"],
        imgCreatedDate: json["Img_CreatedDate"],
        imgLastUpdatedDate: json["Img_LastUpdatedDate"],
        imgCreatedBy: json["Img_CreatedBy"],
        imgLastUpdatedBy: json["Img_LastUpdatedBy"],
        imgState: json["Img_State"],
        imgDistrict: json["Img_District"],
        imgTown: json["Img_Town"],
        imgVerify: json["Img_Verify"],
      );

  Map<String, dynamic> toMap() => {
        "Img_ID": imgId,
        "Img_Name": imgName,
        "Img_Url": imgUrl,
        "Img_BusinessID": imgBusinessId,
        "Img_Category": imgCategory,
        "Img_DocType": imgDocType,
        "Img_Status": imgStatus,
        "Img_CreatedDate": imgCreatedDate,
        "Img_LastUpdatedDate": imgLastUpdatedDate,
        "Img_CreatedBy": imgCreatedBy,
        "Img_LastUpdatedBy": imgLastUpdatedBy,
        "Img_State": imgState,
        "Img_District": imgDistrict,
        "Img_Town": imgTown,
        "Img_Verify": imgVerify,
      };
}
