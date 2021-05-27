// To parse this JSON data, do
//
//     final getStaffListModel = getStaffListModelFromMap(jsonString);

import 'dart:convert';

class GetStaffListModel {
  GetStaffListModel({
    required this.result,
  });

  List<Result> result;

  factory GetStaffListModel.fromJson(String str) =>
      GetStaffListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetStaffListModel.fromMap(Map<String, dynamic> json) =>
      GetStaffListModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.staffId,
    required this.staffName,
    required this.businessId,
    required this.businessname,
    required this.businessAddress,
    required this.staffPhoto,
  });

  int staffId;
  dynamic staffName;
  int businessId;
  String businessname;
  String businessAddress;
  String staffPhoto;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        staffId: json["Staff_ID"],
        staffName: json["Staff_Name"] == '' ? '' : json["Staff_Name"],
        businessId: json["BusinessID"],
        businessname: json["Businessname"],
        businessAddress: json["BusinessAddress"],
        staffPhoto: json["Staff_Photo"],
      );

  Map<String, dynamic> toMap() => {
        "Staff_ID": staffId,
        "Staff_Name": staffName == null ? null : staffName,
        "BusinessID": businessId,
        "Businessname": businessname,
        "BusinessAddress": businessAddress,
        "Staff_Photo": staffPhoto,
      };
}
