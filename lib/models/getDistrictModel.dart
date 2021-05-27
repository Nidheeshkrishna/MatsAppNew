// To parse this JSON data, do
//
//     final getdistrictModel = getdistrictModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class GetdistrictModel {
  GetdistrictModel({
    required this.resultdist,
  });

  List<Resultdist> resultdist;

  factory GetdistrictModel.fromJson(String str) =>
      GetdistrictModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetdistrictModel.fromMap(Map<String, dynamic> json) =>
      GetdistrictModel(
        resultdist: List<Resultdist>.from(
            json["result"].map((x) => Resultdist.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(resultdist.map((x) => x.toMap())),
      };
}

class Resultdist {
  Resultdist({
    required this.pkTown,
    required this.fkState,
    required this.fkDistrict,
  });

  String pkTown;
  String fkState;
  String fkDistrict;

  factory Resultdist.fromJson(String str) =>
      Resultdist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Resultdist.fromMap(Map<String, dynamic> json) => Resultdist(
        pkTown: json["PK_Town"],
        fkState: json["FK_State"],
        fkDistrict: json["FK_District"],
      );

  Map<String, dynamic> toMap() => {
        "PK_Town": pkTown,
        "FK_State": fkState,
        "FK_District": fkDistrict,
      };
}
