import 'package:webapp/models/redeemrequesthistorywidgetModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<RedeemRequestHistoryModel> fetchredeemrequesthistory(
    String mobile) async {
  Map data = {
    'mobile': mobile,
  };
  var url = Uri.parse(
    'http://bapi.matsapp.in/RedeemHistory',
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
    return RedeemRequestHistoryModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
