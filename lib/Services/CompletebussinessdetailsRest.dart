import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webapp/models/completeBussinessDetailsModelnew.dart';

Future<CompleteBusinessRegistrationModel> fetchBussinessRegistration(
    String businessname,
    String ownername,
    String district,
    String town,
    String categoryID,
    String subcategoryID,
    String mobile) async {
  Map data = {
    'mobile': mobile,
    'businessname': businessname,
    'ownername': ownername,
    'district': district,
    'town': town,
    'categoryID': categoryID,
    'subcategory': subcategoryID
  };
  var url = Uri.parse(
    'http://bapi.matsapp.in/MerchantApp_BusinessRegistration',
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
    return CompleteBusinessRegistrationModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
