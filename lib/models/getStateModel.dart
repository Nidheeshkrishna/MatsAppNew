// To parse this JSON data, do
//
//     final getStateModel = getStateModelFromMap(jsonString);

import 'dart:convert';

class GetStateModel {
  GetStateModel({
    required this.result,
  });

  List<Resultstate> result;

  factory GetStateModel.fromJson(String str) =>
      GetStateModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetStateModel.fromMap(Map<String, dynamic> json) => GetStateModel(
        result: List<Resultstate>.from(
            json["result"].map((x) => Resultstate.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Resultstate {
  Resultstate({
    required this.disPkDistrict,
    required this.disFkState,
  });

  String disPkDistrict;
  String disFkState;

  factory Resultstate.fromJson(String str) =>
      Resultstate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Resultstate.fromMap(Map<String, dynamic> json) => Resultstate(
        disPkDistrict: json["Dis_PK_District"],
        disFkState: json["Dis_FK_State"],
      );

  Map<String, dynamic> toMap() => {
        "Dis_PK_District": disPkDistrict,
        "Dis_FK_State": disFkState,
      };
}
