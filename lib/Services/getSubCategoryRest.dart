import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/getSubCategoryModel.dart';

Future<GetsubCategoryModel> fetchSubcategory(int categoryID) async {
  Map data = {
    'categoryID': categoryID,
  };
  var url = Uri.parse(
    "https://bapi.matsapp.in/GetSubCategory",
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
    return GetsubCategoryModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
