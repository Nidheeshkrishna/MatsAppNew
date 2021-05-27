import 'package:webapp/models/redeemrequestapproveModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<RedeemRequestApproveModel> fetchredeemApprove(int transactionID) async {
  Map data = {
    'TransactionID': transactionID,
  };
  var url = Uri.parse(
    'http://admindemo.matsapp.in/mobileapi/ApproveTransaction',
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
    return RedeemRequestApproveModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load registration Api');
  }
}
