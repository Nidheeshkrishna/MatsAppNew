import 'package:webapp/models/ForgetPasswordModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ChangePasswordModel> fetchForgetPassword(
    String mobile, String newpassword, String checkoldpassword) async {
  var url = Uri.parse(
    'http://bapi.matsapp.in/Merchant_changePassword',
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{
      'mobile': mobile,
      'newpassword': newpassword,
      'checkoldpassword': checkoldpassword
    }),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return ChangePasswordModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
