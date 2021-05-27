import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:webapp/models/editButtontextpassingModel.dart';
import 'dart:convert';
import 'package:retrofit/retrofit.dart';
import 'package:http/http.dart' as http;

Future<EditBusinessInfoModel?> fetchdedittext(
  int businessID,
  String businessName,
  String businessOwner,
  String phone,
  String email,
  String address,
  String openingtime,
  String closingtime,
  String websiteurl,
  String description,
  String state,
  String district,
  String town,
  double latitude,
  double longitude,
  int categoryID,
  int subcategoryID,
  String registrationnumber,
  String mobile,
  String apiKey,
) async {
  var response;
  var map = new Map<String, dynamic>();
  map['BusinessID'] = businessID;
  map['BusinessName'] = businessName;
  map['BusinessOwner'] = businessOwner;
  map['Mobile'] = mobile;
  map['email'] = email;
  map['address'] = address;
  map['openingtime'] = openingtime;
  map['closingtime'] = closingtime;
  map['websiteurl'] = websiteurl;
  map['description'] = description;
  map['state'] = state;
  map['district'] = district;
  map['town'] = town;
  map['latitude'] = latitude;
  map['longitude'] = longitude;
  map['categoryID'] = categoryID;
  map['SubcategoryID'] = subcategoryID;
  map['registrationnumber'] = registrationnumber;

  map['api_Key'] = apiKey;

  Map data = {
    'BusinessID': businessID,
    'BusinessName': businessName,
    'BusinessOwner': businessOwner,
    'Phone': mobile,
    'email': email,
    'address': address,
    'openingtime': openingtime,
    'closingtime': closingtime,
    'websiteurl': websiteurl,
    'description': description,
    'state': state,
    'district': district,
    'town': town,
    'latitude': latitude,
    'longitude': longitude,
    'categoryID': categoryID,
    'SubcategoryID': subcategoryID,
    'registrationnumber': registrationnumber,
    'mobile': mobile,
    'api_key': apiKey
  };
  BaseOptions options = new BaseOptions(
    responseType: ResponseType.json,
    baseUrl: "https://bapi.matsapp.in/SaveBusinessInfo",
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  final dioClient = Dio(options);
  try {
    FormData formData = new FormData.fromMap(map);

    final Response response = await dioClient.post(
      "https://bapi.matsapp.in/SaveBusinessInfo",
      data: formData,
    );

    if (response.statusCode == 200) {
      var responseJson = response.data;
      //print('responseJson : $responseJson');

      return EditBusinessInfoModel.fromMap(responseJson);
    } else {
      return throw Exception('Failed to load registration Api');
    }
  } catch (e) {
    print(e);
    return null;
  }
}
