import 'package:webapp/models/getDistrictModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<GetdistrictModel> fetchdistrict(String district) async {
  Map data = {
    'district': district,
  };
  var url = Uri.parse(
    "http://bapi.matsapp.in/GetTowns",
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(data),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return GetdistrictModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
