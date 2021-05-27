// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromMap(jsonString);

import 'dart:convert';

class NotificationListModel {
  NotificationListModel({
    required this.result,
  });

  List<Result> result;

  factory NotificationListModel.fromJson(String str) =>
      NotificationListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationListModel.fromMap(Map<String, dynamic> json) =>
      NotificationListModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.notificationId,
    required this.notificationSender,
    required this.notificationReciever,
    required this.notificationPostId,
    required this.notificationMessage,
    required this.notificationMessageTittle,
    required this.notificationDate,
    required this.notificationViewStatus,
    required this.notificationType,
    required this.notificationTypeId,
    required this.notificationBusinessId,
    required this.notificationProductId,
    required this.notificationState,
    required this.notificationDistrict,
    required this.notificationTown,
    required this.notificationCreatedBy,
    required this.notificationCreatedDate,
    required this.notificationLastUpdatedBy,
    required this.notificationLastUpdatedDate,
    required this.notificationStatus,
    required this.notificationsTransId,
  });

  int notificationId;
  dynamic notificationSender;
  int notificationReciever;
  dynamic notificationPostId;
  String notificationMessage;
  String notificationMessageTittle;
  String notificationDate;
  int notificationViewStatus;
  String notificationType;
  String notificationTypeId;
  int notificationBusinessId;
  dynamic notificationProductId;
  dynamic notificationState;
  dynamic notificationDistrict;
  dynamic notificationTown;
  String notificationCreatedBy;
  String notificationCreatedDate;
  dynamic notificationLastUpdatedBy;
  dynamic notificationLastUpdatedDate;
  String notificationStatus;
  int notificationsTransId;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        notificationId: json["Notification_ID"],
        notificationSender: json["Notification_Sender"],
        notificationReciever: json["Notification_Reciever"],
        notificationPostId: json["Notification_PostID"],
        notificationMessage: json["Notification_Message"],
        notificationMessageTittle: json["Notification_MessageTittle"],
        notificationDate: json["Notification_Date"],
        notificationViewStatus: json["Notification_ViewStatus"],
        notificationType: json["Notification_Type"],
        notificationTypeId: json["Notification_TypeID"],
        notificationBusinessId: json["Notification_BusinessID"],
        notificationProductId: json["Notification_ProductID"],
        notificationState: json["Notification_State"],
        notificationDistrict: json["Notification_District"],
        notificationTown: json["Notification_Town"],
        notificationCreatedBy: json["Notification_CreatedBy"],
        notificationCreatedDate: json["Notification_CreatedDate"],
        notificationLastUpdatedBy: json["Notification_LastUpdatedBy"],
        notificationLastUpdatedDate: json["Notification_LastUpdatedDate"],
        notificationStatus: json["Notification_Status"],
        notificationsTransId: json["Notifications_TransID"],
      );

  Map<String, dynamic> toMap() => {
        "Notification_ID": notificationId,
        "Notification_Sender": notificationSender,
        "Notification_Reciever": notificationReciever,
        "Notification_PostID": notificationPostId,
        "Notification_Message": notificationMessage,
        "Notification_MessageTittle": notificationMessageTittle,
        "Notification_Date": notificationDate,
        "Notification_ViewStatus": notificationViewStatus,
        "Notification_Type": notificationType,
        "Notification_TypeID": notificationTypeId,
        "Notification_BusinessID": notificationBusinessId,
        "Notification_ProductID": notificationProductId,
        "Notification_State": notificationState,
        "Notification_District": notificationDistrict,
        "Notification_Town": notificationTown,
        "Notification_CreatedBy": notificationCreatedBy,
        "Notification_CreatedDate": notificationCreatedDate,
        "Notification_LastUpdatedBy": notificationLastUpdatedBy,
        "Notification_LastUpdatedDate": notificationLastUpdatedDate,
        "Notification_Status": notificationStatus,
        "Notifications_TransID": notificationsTransId,
      };
}
