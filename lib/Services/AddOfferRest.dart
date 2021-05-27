import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:webapp/models/AddOffersModel.dart';

Future<AddOffersModel?> addofferupload(
  String mobile,
  String businessID,
  String offerName,
  String mRP,
  String discounttype,
  String discountPercentage,
  String offerPrice,
  String offerCategory,
  String offerSubcategory,
  String startdate,
  String endDate,
  String description,
  String specification,
  String offerID,
  String imagePath,
  //List<File> files,
  // String cover1,
  // String cover2,
  // String cover3,
) async {
  var response;
  Map data = {
    'mobile': mobile,
    'BusinessID': businessID,
    'offerName': offerName,
    'MRP': mRP,
    'discounttype': discounttype,
    'discountPercentage': discountPercentage,
    'OfferPrice': offerPrice,
    'OfferCategory': offerCategory,
    'OfferSubcategory': offerSubcategory,
    'startdate': startdate,
    'EndDate': endDate,
    'Description': description,
    'Specification': specification,
    'OfferID': offerID,
  };

  String url = 'http://admindemo.matsapp.in/mobileapi/AddOffer' + "?";
  File image = File(imagePath);
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

  final file = await http.MultipartFile.fromPath('image', image.path);
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
      return AddOffersModel.fromMap(jsonDecode(response.body));
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

// Future<String> uploadMultipleImage(List<File> files, String userid) async {
// final prefs = await SharedPreferences.getInstance();
// final key = 'token';
// final value = prefs.get(key) ?? 0;

// // string to uri
// var uri = Uri.parse(serverUrl + "/api/v1/upload_parent_image");

// // create multipart request
// var request = new http.MultipartRequest("POST", uri);

// for (var file in files) {
//     String fileName = file.path.split("/").last;
//     var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));

//     // get file length

//     var length = await file.length(); //imageFile is your image file

//     // multipart that takes file
//     var multipartFileSign = new http.MultipartFile('photo', stream, length, filename: fileName);

//     request.files.add(multipartFileSign);
// }
