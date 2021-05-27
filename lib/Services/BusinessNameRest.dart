import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:webapp/models/BusinessnameModel.dart';

Future<BusinessnameModel> fetchbusinessname(String mobile) async {
  final http.Response response = await http.post(
    Uri.parse('http://admindemo.matsapp.in/mobileapi/getBusinessesOfMerchant'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Mobile': mobile,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //var responseJson = json.decode(response.body);
    //print("responseJson : $responseJson");
    return BusinessnameModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load api');
  }
}
