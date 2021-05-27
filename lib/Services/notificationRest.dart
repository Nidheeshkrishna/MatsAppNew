import 'package:webapp/models/notificationmodel.dart';
import 'package:webapp/models/registrationModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<NotificationListModel> fetchNotification(
  String username,
) async {
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/MerchantListNotifications',
  );
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: jsonEncode(<String, String>{'username': username}),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print('responseJson : $responseJson');
    return NotificationListModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
