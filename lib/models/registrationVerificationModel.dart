// To parse this JSON data, do
//
//     final registrationverificationModel = registrationverificationModelFromMap(jsonString);

import 'dart:convert';

class RegistrationverificationModel {
  RegistrationverificationModel({
    required this.lgPkLoginId,
    required this.lgUsername,
    required this.lgPassword,
    this.lgEmail,
    required this.lgUsertype,
    this.lgStatus,
    required this.lgLastLoginDateTime,
    this.lgState,
    this.lgDistrict,
    this.lgTown,
    this.lgDeviceToken,
  });

  int lgPkLoginId;
  String lgUsername;
  String lgPassword;
  dynamic lgEmail;
  String lgUsertype;
  dynamic lgStatus;
  dynamic lgLastLoginDateTime;
  dynamic lgState;
  dynamic lgDistrict;
  dynamic lgTown;
  dynamic lgDeviceToken;

  factory RegistrationverificationModel.fromJson(String str) =>
      RegistrationverificationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationverificationModel.fromMap(Map<String, dynamic> json) =>
      RegistrationverificationModel(
        lgPkLoginId: json["LG_PK_LoginID"],
        lgUsername: json["LG_Username"],
        lgPassword: json["LG_Password"],
        lgEmail: json["LG_Email"],
        lgUsertype: json["LG_Usertype"],
        lgStatus: json["LG_Status"],
        lgLastLoginDateTime: json["LG_LastLoginDateTime"],
        lgState: json["LG_State"],
        lgDistrict: json["LG_District"],
        lgTown: json["LG_Town"],
        lgDeviceToken: json["LG_DeviceToken"],
      );

  Map<String, dynamic> toMap() => {
        "LG_PK_LoginID": lgPkLoginId,
        "LG_Username": lgUsername,
        "LG_Password": lgPassword,
        "LG_Email": lgEmail,
        "LG_Usertype": lgUsertype,
        "LG_Status": lgStatus,
        "LG_LastLoginDateTime": lgLastLoginDateTime,
        "LG_State": lgState,
        "LG_District": lgDistrict,
        "LG_Town": lgTown,
        "LG_DeviceToken": lgDeviceToken,
      };
}
