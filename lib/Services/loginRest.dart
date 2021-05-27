import 'package:webapp/models/loginModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<LoginModel> fetchLogin(
    String username, String password, String deviceToken) async {
  Map data = {
    'username': username,
    'password': password,
    'deviceToken': deviceToken
  };
  var url = Uri.parse(
    'http://bapi.matsapp.in/LoginApi',
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
    return LoginModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
