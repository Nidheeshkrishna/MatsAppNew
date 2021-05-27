import 'package:webapp/models/storMarchantModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<GetStoreModel> fetchstoreMarchant(String mobile) async {
  Map data = {'mobile': mobile};
  final http.Response response = await http.post(
      Uri.parse(
        "http://bapi.matsapp.in/GetStoresOfMerchant",
      ),
      body: jsonEncode(data));
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson add: $responseJson');
    return GetStoreModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load storeMarchant');
  }
}
