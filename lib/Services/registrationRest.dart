import 'package:webapp/models/registrationModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<RegistrationModel> fetchRegistration(
    String mobile, String password) async {
  var url = Uri.parse(
    'http://bapi.matsapp.in//MerchantRegistration',
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{'mobile': mobile, 'password': password}),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return RegistrationModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
