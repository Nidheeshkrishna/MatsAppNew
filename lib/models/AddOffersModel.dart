import 'dart:convert';

class AddOffersModel {
  AddOffersModel({
    required this.result,
  });

  int result;

  factory AddOffersModel.fromJson(String str) =>
      AddOffersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddOffersModel.fromMap(Map<String, dynamic> json) => AddOffersModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
