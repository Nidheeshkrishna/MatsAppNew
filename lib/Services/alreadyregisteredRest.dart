import 'package:webapp/models/alreadyregisteredModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<AlreadyRegistredModel> fetchAlreadyRegistered(String mobile) async {
  var url = Uri.parse(
    'https://admindemo.matsapp.in/mobileapi/IsAlreadyRegistered',
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{'mobile': mobile}),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return AlreadyRegistredModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
