import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/MatsAppFindModel.dart';

Future<MatsAppFindModel> fetchMatsAppFind(String mobileNo) async {
  Map data = {
    'mobileNo': mobileNo,
  };
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/InfoForFindNotification',
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
    return MatsAppFindModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
