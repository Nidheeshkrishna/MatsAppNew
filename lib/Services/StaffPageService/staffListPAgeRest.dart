import 'package:webapp/models/StaffPageModel/getStafflistModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<GetStaffListModel> fetchstafflist(String mobile) async {
  final http.Response response = await http.post(
    Uri.parse('http://admindemo.matsapp.in/mobileapi/GetStaffList'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Mobile': mobile,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //var responseJson = json.decode(response.body);
    //print("responseJson : $responseJson");
    return GetStaffListModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load api');
  }
}
