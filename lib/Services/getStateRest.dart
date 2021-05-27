import 'package:webapp/models/getStateModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<GetStateModel> fetchState(String state) async {
  Map data = {
    'state': state,
  };
  var url = Uri.parse(
    "http://bapi.matsapp.in/GetDistricts",
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
    return GetStateModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
