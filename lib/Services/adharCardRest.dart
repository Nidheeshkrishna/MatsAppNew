import 'package:webapp/models/PancardImageModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:webapp/models/adharCardModel.dart';

// ignore: non_constant_identifier_names
Future<AdharCardImageUploadModel?> AddadharCardImage(
    int businessID, String adharcard) async {
  var response;
  Map data = {
    'BusinessID': businessID,
    'adharcard': adharcard,
  };

  String url = "http://bapi.matsapp.in/Updateadharcard" + "?";
  File image = File(adharcard);
  //print("upload request : " + params.toString());
  print("file path ${image.path}");
  String formBody = "";
  data.forEach((key, value) => {
        formBody += key + '=' + Uri.encodeQueryComponent(value.toString()) + '&'
      });
  final imageUploadRequest = http.MultipartRequest(
    'POST',
    Uri.parse(url + formBody),
  );

  final file = await http.MultipartFile.fromPath('adharcard', image.path);
  // params.forEach((key, value) {
  //   imageUploadRequest.fields[key] = value;
  // });
  imageUploadRequest.files.add(file);

  print("Started uploading file ");
  try {
    final streamedResponse = await imageUploadRequest.send();
    response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print("Completed uploading file");
      print("responseJson add: $responseJson");
      return AdharCardImageUploadModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load update Profile');
    }

    // onSuccess(_parseResponse(response));
  } catch (e) {
    print(e);
    return null;
    //onException(FetchDataException("Failed to upload image" + e ?? ""));
  }
}
