import 'package:webapp/models/getCategoryModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<GetCategoryModel> fetchcategory() async {
  var url = Uri.parse(
    "https://bapi.matsapp.in/GetCategory",
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return GetCategoryModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
