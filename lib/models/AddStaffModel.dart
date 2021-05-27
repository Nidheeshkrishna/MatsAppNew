// To parse this JSON data, do
//
//     final addStaffModel = addStaffModelFromMap(jsonString);

import 'dart:convert';

class AddStaffModel {
  AddStaffModel({
    required this.result,
  });

  bool result;

  factory AddStaffModel.fromJson(String str) =>
      AddStaffModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddStaffModel.fromMap(Map<String, dynamic> json) => AddStaffModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
