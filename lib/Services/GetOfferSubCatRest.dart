import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:webapp/models/GetOfferSubCatModel.dart';

Future<GetOfferSubCatModel> fetchoffersub(String userID) async {
  final http.Response response = await http.post(
    Uri.parse('https://bapi.matsapp.in/getOfferSubCategory'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'OfferID': userID,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //var responseJson = json.decode(response.body);
    //print("responseJson : $responseJson");
    return GetOfferSubCatModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load api');
  }
}
