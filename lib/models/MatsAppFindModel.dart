// To parse this JSON data, do
//
//     final matsAppFindModel = matsAppFindModelFromMap(jsonString);

import 'dart:convert';

class MatsAppFindModel {
  MatsAppFindModel({
    required this.result,
  });

  List<Result> result;

  factory MatsAppFindModel.fromJson(String str) =>
      MatsAppFindModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatsAppFindModel.fromMap(Map<String, dynamic> json) =>
      MatsAppFindModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.customerName,
    required this.phoneNumber,
    required this.findDescription,
    required this.imageUrl,
    required this.findId,
    required this.date,
  });

  String customerName;
  String phoneNumber;
  dynamic findDescription;
  String imageUrl;
  int findId;
  String date;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        customerName: json["CustomerName"],
        phoneNumber: json["PhoneNumber"],
        findDescription: json["findDescription"],
        imageUrl: json["imageURL"],
        findId: json["FindID"],
        date: json["Date"],
      );

  Map<String, dynamic> toMap() => {
        "CustomerName": customerName,
        "PhoneNumber": phoneNumber,
        "findDescription": findDescription,
        "imageURL": imageUrl,
        "FindID": findId,
        "Date": date,
      };
}
