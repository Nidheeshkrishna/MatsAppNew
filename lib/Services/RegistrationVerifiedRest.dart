import 'package:webapp/models/loginModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/registrationVerificationModel.dart';

Future<RegistrationverificationModel> fetchVerification(
    String mobile, String password) async {
  Map data = {
    'mobile': mobile,
    'password': password,
  };
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/MerchantApp_Registration_Verified',
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
    return RegistrationverificationModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
