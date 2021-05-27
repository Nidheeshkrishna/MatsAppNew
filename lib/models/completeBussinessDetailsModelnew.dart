// To parse this JSON data, do
//
//     final getsubCategoryModel = getsubCategoryModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CompleteBusinessRegistrationModel {
  CompleteBusinessRegistrationModel({
    required this.bmPkBusinessId,
    required this.bmBusinessName,
    required this.bmContactName,
    required this.bmAddress,
    required this.bmEmail,
    required this.bmPhone,
    required this.bmWebsite,
    required this.bmLandline,
    required this.bmDescription,
    required this.bmCategory,
    required this.bmProductOrService,
    required this.bmLatitude,
    required this.bmState,
    required this.bmDistrict,
    required this.bmTown,
    required this.bmPincode,
    required this.bmPrimePosition,
    required this.bmBusinessPlan,
    required this.bmProvideOffers,
    required this.bmProvideCoupons,
    required this.bmCouponsInterested,
    required this.bmIsBusinessRelatedToMall,
    required this.bmCoverImageUrl,
    required this.bmLogoUrl,
    required this.bmCreatedBy,
    required this.bmCreatedDate,
    required this.bmLastUpdatedTime,
    required this.bmLastUpdatedBy,
    required this.bmFkLoginId,
    required this.bmSubCategory,
    required this.bmKeywords,
    required this.bmPriority,
    required this.bmSubTown,
    required this.bmLongitude,
    required this.bmPriorityRank,
    required this.bmMatsappDiscount,
    required this.bmStartTime,
    required this.bmEndTime,
    required this.bmSpecification,
    required this.bmDocType,
    required this.bmStatus,
    required this.bmIsMall,
    required this.bmMallId,
    required this.bmCouponPreviousText,
    required this.bmVerify,
    required this.bmDeleteConfirmStatus,
    required this.bmEditStatus,
  });

  dynamic bmPkBusinessId;
  dynamic bmBusinessName;
  String bmContactName;
  String bmAddress;
  String bmEmail;
  String bmPhone;
  String bmWebsite;
  String bmLandline;
  String bmDescription;
  dynamic bmCategory;
  dynamic bmProductOrService;
  String bmLatitude;
  String bmState;
  String bmDistrict;
  String bmTown;
  String bmPincode;
  dynamic bmPrimePosition;
  String bmBusinessPlan;
  dynamic bmProvideOffers;
  dynamic bmProvideCoupons;
  dynamic bmCouponsInterested;
  dynamic bmIsBusinessRelatedToMall;
  dynamic bmCoverImageUrl;
  dynamic bmLogoUrl;
  String bmCreatedBy;
  String bmCreatedDate;
  String bmLastUpdatedTime;
  dynamic bmLastUpdatedBy;
  dynamic bmFkLoginId;
  dynamic bmSubCategory;
  String bmKeywords;
  dynamic bmPriority;
  String bmSubTown;
  String bmLongitude;
  dynamic bmPriorityRank;
  dynamic bmMatsappDiscount;
  dynamic bmStartTime;
  dynamic bmEndTime;
  String bmSpecification;
  String bmDocType;
  String bmStatus;
  dynamic bmIsMall;
  dynamic bmMallId;
  dynamic bmCouponPreviousText;
  dynamic bmVerify;
  dynamic bmDeleteConfirmStatus;
  dynamic bmEditStatus;

  factory CompleteBusinessRegistrationModel.fromJson(String str) =>
      CompleteBusinessRegistrationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompleteBusinessRegistrationModel.fromMap(
          Map<String, dynamic> json) =>
      CompleteBusinessRegistrationModel(
        bmPkBusinessId: json["BM_PK_BusinessID"],
        bmBusinessName: json["BM_BusinessName"],
        bmContactName: json["BM_ContactName"],
        bmAddress: json["BM_Address"],
        bmEmail: json["BM_Email"],
        bmPhone: json["BM_Phone"],
        bmWebsite: json["BM_Website"],
        bmLandline: json["BM_Landline"],
        bmDescription: json["BM_Description"],
        bmCategory: json["BM_Category"],
        bmProductOrService: json["BM_ProductOrService"],
        bmLatitude: json["BM_Latitude"],
        bmState: json["BM_State"],
        bmDistrict: json["BM_District"],
        bmTown: json["BM_Town"],
        bmPincode: json["BM_Pincode"],
        bmPrimePosition: json["BM_PrimePosition"],
        bmBusinessPlan: json["BM_BusinessPlan"],
        bmProvideOffers: json["BM_ProvideOffers"],
        bmProvideCoupons: json["BM_ProvideCoupons"],
        bmCouponsInterested: json["BM_CouponsInterested"],
        bmIsBusinessRelatedToMall: json["BM_IsBusinessRelatedToMall"],
        bmCoverImageUrl: json["BM_CoverImageUrl"],
        bmLogoUrl: json["BM_LogoUrl"],
        bmCreatedBy: json["BM_CreatedBy"],
        bmCreatedDate: json["BM_CreatedDate"],
        bmLastUpdatedTime: json["BM_LastUpdatedTime"],
        bmLastUpdatedBy: json["BM_LastUpdatedBy"],
        bmFkLoginId: json["BM_FK_LoginID"],
        bmSubCategory: json["BM_SubCategory"],
        bmKeywords: json["BM_Keywords"],
        bmPriority: json["BM_Priority"],
        bmSubTown: json["BM_SubTown"],
        bmLongitude: json["BM_Longitude"],
        bmPriorityRank: json["BM_PriorityRank"],
        bmMatsappDiscount: json["BM_Matsapp_Discount"],
        bmStartTime: json["BM_StartTime"],
        bmEndTime: json["BM_EndTime"],
        bmSpecification: json["BM_Specification"],
        bmDocType: json["BM_DocType"],
        bmStatus: json["BM_Status"],
        bmIsMall: json["BM_IsMall"],
        bmMallId: json["BM_MallId"],
        bmCouponPreviousText: json["BM_CouponPreviousText"],
        bmVerify: json["BM_Verify"],
        bmDeleteConfirmStatus: json["BM_DeleteConfirmStatus"],
        bmEditStatus: json["BM_EditStatus"],
      );

  Map<String, dynamic> toMap() => {
        "BM_PK_BusinessID": bmPkBusinessId,
        "BM_BusinessName": bmBusinessName,
        "BM_ContactName": bmContactName,
        "BM_Address": bmAddress,
        "BM_Email": bmEmail,
        "BM_Phone": bmPhone,
        "BM_Website": bmWebsite,
        "BM_Landline": bmLandline,
        "BM_Description": bmDescription,
        "BM_Category": bmCategory,
        "BM_ProductOrService": bmProductOrService,
        "BM_Latitude": bmLatitude,
        "BM_State": bmState,
        "BM_District": bmDistrict,
        "BM_Town": bmTown,
        "BM_Pincode": bmPincode,
        "BM_PrimePosition": bmPrimePosition,
        "BM_BusinessPlan": bmBusinessPlan,
        "BM_ProvideOffers": bmProvideOffers,
        "BM_ProvideCoupons": bmProvideCoupons,
        "BM_CouponsInterested": bmCouponsInterested,
        "BM_IsBusinessRelatedToMall": bmIsBusinessRelatedToMall,
        "BM_CoverImageUrl": bmCoverImageUrl,
        "BM_LogoUrl": bmLogoUrl,
        "BM_CreatedBy": bmCreatedBy,
        "BM_CreatedDate": bmCreatedDate,
        "BM_LastUpdatedTime": bmLastUpdatedTime,
        "BM_LastUpdatedBy": bmLastUpdatedBy,
        "BM_FK_LoginID": bmFkLoginId,
        "BM_SubCategory": bmSubCategory,
        "BM_Keywords": bmKeywords,
        "BM_Priority": bmPriority,
        "BM_SubTown": bmSubTown,
        "BM_Longitude": bmLongitude,
        "BM_PriorityRank": bmPriorityRank,
        "BM_Matsapp_Discount": bmMatsappDiscount,
        "BM_StartTime": bmStartTime,
        "BM_EndTime": bmEndTime,
        "BM_Specification": bmSpecification,
        "BM_DocType": bmDocType,
        "BM_Status": bmStatus,
        "BM_IsMall": bmIsMall,
        "BM_MallId": bmMallId,
        "BM_CouponPreviousText": bmCouponPreviousText,
        "BM_Verify": bmVerify,
        "BM_DeleteConfirmStatus": bmDeleteConfirmStatus,
        "BM_EditStatus": bmEditStatus,
      };
}
