import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/declineModel.dart';

Future<DeclineModel> fetchdecline(String mobile, String findID) async {
  Map data = {
    'mobile': mobile,
    'findID': findID,
  };
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/DeclineForFind',
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
    return DeclineModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
