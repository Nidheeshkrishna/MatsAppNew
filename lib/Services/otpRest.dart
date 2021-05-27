import 'package:webapp/models/loginModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/otpModel.dart';

Future<GetstatusOfOtpModel> fetchOtp(String oTP, String mobile) async {
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/Merchant_VerifyOTP',
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{
      'oTP': oTP,
      'mobile': mobile,
    }),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return GetstatusOfOtpModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
