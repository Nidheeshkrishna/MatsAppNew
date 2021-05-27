import 'package:webapp/models/storePreviewModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<StorePreviewPageModel> fetchstoreMarchant(int businessID) async {
  Map data = {'BusinessID': businessID};
  final http.Response response = await http.post(
    Uri.parse(
      "https://bapi.matsapp.in/getEditBusinessInfo",
    ),
    body: jsonEncode(data),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson add: $responseJson');
    return StorePreviewPageModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load storeMarchant');
  }
}
