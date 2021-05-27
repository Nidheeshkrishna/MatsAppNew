import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:webapp/models/getImageModel.dart';

// ignore: non_constant_identifier_names
Future<GetImageModel> getImages(
  String businessID,
) async {
  final String apiUrl = 'http://admindemo.matsapp.in/mobileapi/getImages';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{
      'BusinessID': businessID,
    }),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return GetImageModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception("Failed");
  }
}
