import 'package:meta/meta.dart';
import 'dart:convert';

class CertificatedocModel {
  CertificatedocModel({
    required this.result,
  });

  int result;

  factory CertificatedocModel.fromJson(String str) =>
      CertificatedocModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CertificatedocModel.fromMap(Map<String, dynamic> json) =>
      CertificatedocModel(
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
      };
}
