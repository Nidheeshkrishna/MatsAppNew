import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/homepage.dart';
import 'package:webapp/Services/adharCardRest.dart';
import 'package:webapp/Services/certificateDocRest.dart';
import 'package:webapp/Services/coverImageUploadRest.dart';
import 'package:webapp/Services/editButtonRest.dart';
import 'package:webapp/Services/getCategoryRest.dart';
import 'package:webapp/Services/getStateRest.dart';
import 'package:webapp/Services/getSubCategoryRest.dart';
import 'package:webapp/Services/getdistrictRest.dart';
import 'package:webapp/Services/logoImageUploadRest.dart';
import 'package:webapp/Services/panCardRest.dart';
import 'package:webapp/Services/shopfrontImageRest.dart';
import 'package:webapp/models/getCategoryModel.dart';
import 'package:webapp/models/getDistrictModel.dart';
import 'package:webapp/models/getStateModel.dart';
import 'package:webapp/models/getSubCategoryModel.dart';

import 'package:webapp/widgets/BusinessprofTextForem.dart';
import 'package:webapp/widgets/ImageUploadWidget.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class CompleteBusinessProfile extends StatefulWidget {
  dynamic sharedkey;
  int businessID;
  CompleteBusinessProfile({required this.businessID, this.sharedkey});
  @override
  _CompleteBusinessProfileState createState() =>
      _CompleteBusinessProfileState();
}

class _CompleteBusinessProfileState extends State<CompleteBusinessProfile> {
  TextEditingController businessname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController websiteurl = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController streetname = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController categories = TextEditingController();
  TextEditingController subcategory = TextEditingController();
  TextEditingController gstregno = TextEditingController();
  TextEditingController openingtime = TextEditingController();
  TextEditingController closingtime = TextEditingController();
  bool status = false;
  late int logouploadstatus;
  int coverstatus = 0;
  late int panstatus;
  int adharstatus = 0;
  int certificatestatus = 0;
  int shopfrontstatus = 0;
  String statedatavalue = '';
  String districtdatavalue = '';
  String logopath = "";
  String coverpath = "";
  String adharpath = "";
  String pancardpath = "";
  String shopfrontpath = "";
  String certificatepath = "";
  File imageFilelogo = File('');

  File imageFilecover = File('');

  File imageFilepancard = File('');

  File imageFileadhar = File('');

  File imageFilefrontphoto = File('');

  File imageFileregistrationcertificate = File('');

  late Future<Resultstate> data1;
  late List<Resultstate> statedata;

  var selectedTime;

  String passedClosingTime = "";

  String status_value = "";

  late List<ResultCategory> catagorydata;

  late int categoryID;

  late String categorydatavalue;

  late List<ResultsubCategory> subcatagorydata;

  late String subcategoryvalue;

  late int subcategoryID;

  Future getDatastate() async {
    await fetchState("Kerala").then((value1) => {
          statedatavalue = value1.result[0].disFkState.toString(),
        });
  }

  late Future<Resultdist> data;
  late List<Resultdist> districtdata;
  Future getData() async {
    await fetchdistrict("Thrissur").then((value2) => {
          districtdatavalue = value2.resultdist[0].fkDistrict.toString(),
        });
  }

  String? mobileNumber = '';

  var sharedPrefs;

  String apikey = '';
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
      setState(() {
        //townSelectedStore = sharedPrefs.getString('SELECTED_TOWN');
        mobileNumber = sharedPrefs.getString('USER_MOBILE');
        //deviceToken = sharedPrefs.getString('USER_API_Token');
        apikey = sharedPrefs.getString("USER_API_KEY");
        //print("Token $deviceToken");
        phonenumber.text = mobileNumber.toString();
        loading = false;
      });

      //hotSpotsFuture = fetchHotSpot(townSelectedStore);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 181, 23, 1),
        title: Text('Complete Business Profile'),
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        color: Color.fromRGBO(255, 181, 23, 1),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 170,
                        width: 180,
                        child: ImageUploadWidget(
                          headtext: 'Logo Image',
                          imageFile: imageFilelogo,
                          buttonAction: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: 150,
                                      child: Column(children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.photo_camera),
                                          title: Text("Camera"),
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            // show the camera
                                            final pickerlogo = ImagePicker();
                                            final pickedFilelogo =
                                                await pickerlogo.getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              logopath = pickedFilelogo!.path;
                                              imageFilelogo =
                                                  File(pickedFilelogo.path);
                                            });
                                            print(logopath);
                                            //  _showPhotoLibrary();
                                            print("tap");
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text("Choose from Gallery"),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            final _picker = ImagePicker();
                                            final pickedFile =
                                                await _picker.getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              logopath = pickedFile!.path;
                                              imageFilelogo =
                                                  File(pickedFile.path);
                                            });
                                            print(logopath);
                                          },
                                        )
                                      ]));
                                });
                          },
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        padding: EdgeInsets.all(6),
                        child: ImageUploadWidget(
                          headtext: 'Cover Image',
                          imageFile: imageFilecover,
                          buttonAction: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: 150,
                                      child: Column(children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.photo_camera),
                                          title: Text("Camera"),
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            // show the camera
                                            final _pickercover = ImagePicker();
                                            final pickedFilecover =
                                                await _pickercover.getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              coverpath = pickedFilecover!.path;
                                              imageFilecover =
                                                  File(pickedFilecover.path);
                                            });
                                            print(coverpath);
                                            //  _showPhotoLibrary();
                                            print("tap");
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text("Choose from Gallery"),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            final _picker = ImagePicker();
                                            final pickedFile =
                                                await _picker.getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              coverpath = pickedFile!.path;
                                              imageFilecover =
                                                  File(pickedFile.path);
                                            });
                                            print(coverpath);
                                          },
                                        )
                                      ]));
                                });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  child: BusinessProfileTextform(
                    controllerobject: businessname,
                    maxline: 1,
                    minline: 1,
                    hindtext: 'Enter your Business Name',
                    labeltext: 'Business Name*',
                  ),
                ),
                Container(
                  height: 90,
                  child: BusinessProfileTextform(
                    controllerobject: ownername,
                    maxline: 1,
                    minline: 1,
                    hindtext: 'Enter your Business Owner',
                    labeltext: 'Business Owner',
                  ),
                ),
                Container(
                  height: 90,
                  child: BusinessProfileTextform(
                    controllerobject: phonenumber,
                    maxline: 1,
                    minline: 1,
                    hindtext: 'Enter Phone Number',
                    labeltext: 'Phone Number*',
                  ),
                ),
                Container(
                  height: 90,
                  child: BusinessProfileTextform(
                    controllerobject: email,
                    maxline: 1,
                    minline: 1,
                    hindtext: 'Enter Email ID',
                    labeltext: 'Email',
                  ),
                ),
                Container(
                  child: BusinessProfileTextform(
                    controllerobject: address,
                    maxline: 3,
                    minline: 3,
                    hindtext: 'Enter Address Here',
                    labeltext: 'Address',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 180,
                          height: 100,
                          child: InkWell(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay selectedTime = TimeOfDay.now();
                                final TimeOfDay picked_s =
                                    (await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        false),
                                            child: child!,
                                          );
                                        }))!;

                                if (picked_s != null &&
                                    picked_s != selectedTime)
                                  setState(() {
                                    selectedTime = picked_s;

                                    openingtime.text =
                                        picked_s.format(context).toString();
                                  });
                              },
                              controller: openingtime,
                              minLines: 1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                focusColor: Color.fromRGBO(255, 181, 23, 1),
                                labelText: "Open Time",
                                hintText: "opening Time",
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 181, 23, 1),
                                    )),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Color.fromRGBO(255, 181, 23, 1),
                                )),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Color.fromRGBO(255, 181, 23, 1),
                                )),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                          width: 180,
                          height: 100,
                          child: InkWell(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay selectedTime = TimeOfDay.now();
                                final TimeOfDay picked_s =
                                    (await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        true),
                                            child: child!,
                                          );
                                        }))!;

                                if (picked_s != null &&
                                    picked_s != selectedTime)
                                  setState(() {
                                    selectedTime = picked_s;

                                    // the "dd/MM/yyyy HH:mm" format

                                    closingtime.text =
                                        picked_s.format(context).toString();
                                  });
                              },
                              controller: closingtime,
                              minLines: 1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                focusColor: Color.fromRGBO(255, 181, 23, 1),
                                labelText: "Close Time",
                                hintText: "closing Time",
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 181, 23, 1),
                                    )),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Color.fromRGBO(255, 181, 23, 1),
                                )),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Color.fromRGBO(255, 181, 23, 1),
                                )),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  child: BusinessProfileTextform(
                    controllerobject: websiteurl,
                    maxline: 1,
                    minline: 1,
                    hindtext: 'Enter Website Url',
                    labeltext: 'Website Url',
                  ),
                ),
                Container(
                  child: BusinessProfileTextform(
                    controllerobject: description,
                    maxline: 5,
                    minline: 5,
                    hindtext: 'Enter Description',
                    labeltext: 'Description',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 180,
                            height: 60,
                            child: FutureBuilder<GetStateModel>(
                                future: fetchState("Kerala"),
                                builder: (BuildContext context,
                                    AsyncSnapshot<GetStateModel> snapshot) {
                                  if (snapshot.hasData) {
                                    statedata = snapshot.data!.result;

                                    return DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          focusColor:
                                              Color.fromRGBO(255, 181, 23, 1),
                                          focusedBorder: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0),
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 181, 23, 1),
                                              )),
                                          enabledBorder: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                            color:
                                                Color.fromRGBO(255, 181, 23, 1),
                                          )),
                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                            color:
                                                Color.fromRGBO(255, 181, 23, 1),
                                          )),
                                        ),
                                        items: statedata.map((item1) {
                                          return new DropdownMenuItem(
                                            child:
                                                new Text(item1.disPkDistrict),
                                            value: item1.disPkDistrict,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            statedatavalue = value.toString();
                                          });
                                        });
                                  } else
                                    return Center(
                                        child: CircularProgressIndicator());
                                }),
                          ),
                          Container(
                            width: 180,
                            height: 60,
                            child: FutureBuilder<GetdistrictModel>(
                                future: fetchdistrict("Thrissur"),
                                builder: (BuildContext context,
                                    AsyncSnapshot<GetdistrictModel> snapshot) {
                                  if (snapshot.hasData) {
                                    districtdata = snapshot.data!.resultdist;

                                    return DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        focusColor:
                                            Color.fromRGBO(255, 181, 23, 1),
                                        focusedBorder: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 181, 23, 1),
                                            )),
                                        enabledBorder: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                          color:
                                              Color.fromRGBO(255, 181, 23, 1),
                                        )),
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                          color:
                                              Color.fromRGBO(255, 181, 23, 1),
                                        )),
                                      ),
                                      hint: Text('town'),
                                      items: districtdata.map((item) {
                                        return new DropdownMenuItem(
                                          child: new Text(item.pkTown),
                                          value: item.pkTown,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          districtdatavalue = value.toString();
                                        });
                                      },
                                    );
                                  } else
                                    return Center(
                                        child: CircularProgressIndicator());
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 90,
                        child: BusinessProfileTextform(
                          controllerobject: streetname,
                          maxline: 1,
                          minline: 1,
                          hindtext: 'Street Name',
                          labeltext: 'Street Name',
                        ),
                      ),
                      Container(
                        height: 90,
                        child: BusinessProfileTextform(
                          controllerobject: latitude,
                          maxline: 1,
                          minline: 1,
                          hindtext: 'Latitude',
                          labeltext: 'Latitude',
                        ),
                      ),
                      Container(
                        height: 90,
                        child: BusinessProfileTextform(
                          controllerobject: longitude,
                          maxline: 1,
                          minline: 1,
                          hindtext: 'Longitude',
                          labeltext: 'Longitude',
                        ),
                      ),
                      Container(
                        height: 90,
                        child: FutureBuilder<GetCategoryModel>(
                            future: fetchcategory(),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetCategoryModel> snapshot) {
                              if (snapshot.hasData) {
                                catagorydata = snapshot.data!.result;

                                return DropdownButtonFormField(
                                    hint: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('Category')),
                                    items: catagorydata.map((item) {
                                      categoryID = item.id;
                                      return new DropdownMenuItem(
                                        child: new Text(item.categoryName),
                                        value: item.categoryName,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        categorydatavalue = value.toString();
                                      });
                                    });
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      Container(
                        height: 90,
                        child: FutureBuilder<GetsubCategoryModel>(
                            future: fetchSubcategory(4),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetsubCategoryModel> snapshot) {
                              if (snapshot.hasData) {
                                subcatagorydata = snapshot.data!.result;

                                return DropdownButtonFormField(
                                    hint: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('subCategory')),
                                    items: subcatagorydata.map((item) {
                                      subcategoryID = item.bscId;
                                      return new DropdownMenuItem(
                                        child: new Text(item.bscSubCatgName),
                                        value: item.bscSubCatgName,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        subcategoryvalue = value.toString();
                                      });
                                    });
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('ADD KYC DETAILS'),
                      Container(
                        height: 90,
                        child: BusinessProfileTextform(
                          controllerobject: gstregno,
                          maxline: 1,
                          minline: 1,
                          hindtext: 'Gst Registration Number',
                          labeltext: 'Gst Registration Number',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 180,
                              child: ImageUploadWidget(
                                headtext: 'Pan Card',
                                imageFile: imageFilepancard,
                                buttonAction: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 150,
                                            child: Column(children: <Widget>[
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_camera),
                                                title: Text("Camera"),
                                                onTap: () async {
                                                  Navigator.of(context).pop();
                                                  // show the camera
                                                  final _picker = ImagePicker();
                                                  final pickedFilepancard =
                                                      await _picker.getImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    pancardpath =
                                                        pickedFilepancard!.path;
                                                    imageFilepancard = File(
                                                        pickedFilepancard.path);
                                                  });
                                                  print(pancardpath);
                                                  //  _showPhotoLibrary();
                                                  print("tap");
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title:
                                                    Text("Choose from Gallery"),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final _pickerpancard =
                                                      ImagePicker();
                                                  final pickedFilepancard =
                                                      await _pickerpancard
                                                          .getImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  setState(() {
                                                    pancardpath =
                                                        pickedFilepancard!.path;
                                                    imageFilepancard = File(
                                                        pickedFilepancard.path);
                                                  });
                                                  print(pancardpath);
                                                },
                                              )
                                            ]));
                                      });
                                },
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 180,
                              padding: EdgeInsets.all(6),
                              child: ImageUploadWidget(
                                headtext: 'Adhar Card',
                                imageFile: imageFileadhar,
                                buttonAction: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 150,
                                            child: Column(children: <Widget>[
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_camera),
                                                title: Text("Camera"),
                                                onTap: () async {
                                                  Navigator.of(context).pop();
                                                  // show the camera
                                                  final _picker = ImagePicker();
                                                  final pickedFileadhar =
                                                      await _picker.getImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    adharpath =
                                                        pickedFileadhar!.path;
                                                    imageFileadhar = File(
                                                        pickedFileadhar.path);
                                                  });
                                                  print(adharpath);
                                                  //  _showPhotoLibrary();
                                                  print("tap");
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title:
                                                    Text("Choose from Gallery"),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final _pickeradhar =
                                                      ImagePicker();
                                                  final pickedFileadhar =
                                                      await _pickeradhar
                                                          .getImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  setState(() {
                                                    adharpath =
                                                        pickedFileadhar!.path;
                                                    imageFileadhar = File(
                                                        pickedFileadhar.path);
                                                  });
                                                  print(adharpath);
                                                },
                                              )
                                            ]));
                                      });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 170,
                              width: 180,
                              child: ImageUploadWidget(
                                headtext: 'Shop front Photo',
                                imageFile: imageFilefrontphoto,
                                buttonAction: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 150,
                                            child: Column(children: <Widget>[
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_camera),
                                                title: Text("Camera"),
                                                onTap: () async {
                                                  Navigator.of(context).pop();
                                                  // show the camera
                                                  final _picker = ImagePicker();
                                                  final pickedFilefrontphoto =
                                                      await _picker.getImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    shopfrontpath =
                                                        pickedFilefrontphoto!
                                                            .path;
                                                    imageFilefrontphoto = File(
                                                        pickedFilefrontphoto
                                                            .path);
                                                  });
                                                  print(shopfrontpath);
                                                  //  _showPhotoLibrary();
                                                  print("tap");
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title:
                                                    Text("Choose from Gallery"),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final _pickerfrontphoto =
                                                      ImagePicker();
                                                  final pickedFilefrontphoto =
                                                      await _pickerfrontphoto
                                                          .getImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  setState(() {
                                                    shopfrontpath =
                                                        pickedFilefrontphoto!
                                                            .path;
                                                    imageFilefrontphoto = File(
                                                        pickedFilefrontphoto
                                                            .path);
                                                  });
                                                  print(shopfrontpath);
                                                },
                                              )
                                            ]));
                                      });
                                },
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 180,
                              padding: EdgeInsets.all(6),
                              child: ImageUploadWidget(
                                headtext: 'Registration Certificate',
                                imageFile: imageFileregistrationcertificate,
                                buttonAction: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 150,
                                            child: Column(children: <Widget>[
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_camera),
                                                title: Text("Camera"),
                                                onTap: () async {
                                                  Navigator.of(context).pop();
                                                  // show the camera
                                                  final _picker = ImagePicker();
                                                  final pickedFilecertificate =
                                                      await _picker.getImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    certificatepath =
                                                        pickedFilecertificate!
                                                            .path;
                                                    imageFileregistrationcertificate =
                                                        File(
                                                            pickedFilecertificate
                                                                .path);
                                                  });
                                                  print(certificatepath);
                                                  //  _showPhotoLibrary();
                                                  print("tap");
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title:
                                                    Text("Choose from Gallery"),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final _picker = ImagePicker();
                                                  final pickedFilecertificate =
                                                      await _picker.getImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    certificatepath =
                                                        pickedFilecertificate!
                                                            .path;
                                                    imageFileregistrationcertificate =
                                                        File(
                                                            pickedFilecertificate
                                                                .path);
                                                  });
                                                  print(certificatepath);
                                                },
                                              )
                                            ]));
                                      });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: loading
                            ? LinearProgressIndicator()
                            : Text("Press button for editing",
                                style: TextStyle(fontSize: 25)),
                      ),
                      RaisedButton(
                          color: Colors.red,
                          child: Container(
                              padding: EdgeInsets.only(left: 145, right: 150),
                              child: Text('Save')),
                          onPressed: () async {
                            if (categoryID.toString() == '' &&
                                subcategoryID.toString() == '' &&
                                statedatavalue.characters.toString() == '' &&
                                districtdatavalue.characters.toString() == '' &&
                                openingtime.text.toString() == '' &&
                                closingtime.text.toString() == '' &&
                                logopath.toString() == '' &&
                                coverpath.toString() == '' &&
                                pancardpath.toString() == '' &&
                                adharpath.toString() == '' &&
                                shopfrontpath.toString() == '' &&
                                certificatepath.toString() == '' &&
                                businessname.text.toString() == '' &&
                                ownername.text.toString() == '' &&
                                email.text.toString() == '' &&
                                address.text.toString() == '' &&
                                websiteurl.text.toString() == '' &&
                                description.text.toString() == '' &&
                                streetname.text.toString() == '' &&
                                latitude.text.toString() == '' &&
                                longitude.text.toString() == '' &&
                                gstregno.text.toString() == '') {
                              Fluttertoast.showToast(
                                  msg: "Please enter details",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              setState(() {
                                loading = !loading;
                              });
                              fetchdedittext(
                                      105272,
                                      businessname.text.toString(),
                                      ownername.text.toString(),
                                      phonenumber.text.toString(),
                                      email.text.toString(),
                                      address.text.toString(),
                                      openingtime.text.toString(),
                                      closingtime.text.toString(),
                                      websiteurl.text.toString(),
                                      description.text.toString(),
                                      'kerala',
                                      statedatavalue.characters.toString(),
                                      districtdatavalue.characters.toString(),
                                      double.parse(latitude.text),
                                      double.parse(longitude.text),
                                      categoryID,
                                      subcategoryID,
                                      gstregno.text.toString(),
                                      phonenumber.text.toString(),
                                      apikey)
                                  .then(
                                    (value) => status = value!.result,
                                  )
                                  .whenComplete(() => {
                                        if (status == true)
                                          {
                                            Fluttertoast.showToast(
                                                msg: "Loading...",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0),
                                            AddLogoImage(105272, logopath)
                                                .then((value) =>
                                                    logouploadstatus =
                                                        value!.result)
                                                .whenComplete(() => {
                                                      if (logouploadstatus == 1)
                                                        {
                                                          setState(() {
                                                            loading = !loading;
                                                          }),
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "LoadingLogoImage...",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0),
                                                          AddCoverImage(105272,
                                                                  coverpath)
                                                              .then((value) =>
                                                                  coverstatus =
                                                                      value!
                                                                          .result)
                                                              .whenComplete(
                                                                  () => {
                                                                        if (coverstatus ==
                                                                            1)
                                                                          {
                                                                            setState(() {
                                                                              loading = !loading;
                                                                            }),
                                                                            Fluttertoast.showToast(
                                                                                msg: "LoadingCoverImage...",
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.CENTER,
                                                                                timeInSecForIosWeb: 1,
                                                                                backgroundColor: Colors.red,
                                                                                textColor: Colors.white,
                                                                                fontSize: 16.0),
                                                                            AddPanCardImage(105272, pancardpath).then((value) => panstatus = value!.result).whenComplete(() =>
                                                                                {
                                                                                  if (panstatus == 1)
                                                                                    {
                                                                                      setState(() {
                                                                                        loading = !loading;
                                                                                      }),
                                                                                      Fluttertoast.showToast(msg: "LoadingPanCardImage...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                      AddadharCardImage(105272, adharpath).then((value) => adharstatus = value!.result).whenComplete(() => {
                                                                                            if (adharstatus == 1)
                                                                                              {
                                                                                                setState(() {
                                                                                                  loading = !loading;
                                                                                                }),
                                                                                                Fluttertoast.showToast(msg: "LoadingAdharcardImage...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                                AddshopFrontImage(105272, shopfrontpath).then((value) => shopfrontstatus = value!.result).whenComplete(() => {
                                                                                                      if (shopfrontstatus == 1)
                                                                                                        {
                                                                                                          setState(() {
                                                                                                            loading = !loading;
                                                                                                          }),
                                                                                                          Fluttertoast.showToast(msg: "LoadingShopFrontImage...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.orange, textColor: Colors.white, fontSize: 16.0),
                                                                                                          AddRegistrationdocImage(105272, certificatepath).then((value) => certificatestatus = value!.result).whenComplete(() => {
                                                                                                                if (certificatestatus == 1)
                                                                                                                  {
                                                                                                                    setState(() {
                                                                                                                      loading = !loading;
                                                                                                                    }),
                                                                                                                    Fluttertoast.showToast(msg: "LoadingRegistrationDoc...", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.orange, textColor: Colors.white, fontSize: 16.0),
                                                                                                                    Fluttertoast.showToast(msg: "Loading Completed and Please wait your confirmation", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.orange, textColor: Colors.white, fontSize: 16.0),
                                                                                                                    Navigator.push(
                                                                                                                      context,
                                                                                                                      MaterialPageRoute(
                                                                                                                          builder: (context) => HomePage(
                                                                                                                                
                                                                                                                              )),
                                                                                                                    )
                                                                                                                  }
                                                                                                                else
                                                                                                                  {
                                                                                                                    Fluttertoast.showToast(msg: "Something went wrong", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                                                  }
                                                                                                              }),
                                                                                                        }
                                                                                                      else
                                                                                                        {
                                                                                                          Fluttertoast.showToast(msg: "Pick shop front photo", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                                        }
                                                                                                    }),
                                                                                              }
                                                                                            else
                                                                                              {
                                                                                                Fluttertoast.showToast(msg: "Please pick adharcard", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                              }
                                                                                          }),
                                                                                    }
                                                                                  else
                                                                                    {
                                                                                      Fluttertoast.showToast(msg: "Something went wrong", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0),
                                                                                    }
                                                                                }),
                                                                          }
                                                                        else
                                                                          {
                                                                            Fluttertoast.showToast(
                                                                                msg: "Something went wrong",
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.CENTER,
                                                                                timeInSecForIosWeb: 1,
                                                                                backgroundColor: Colors.red,
                                                                                textColor: Colors.white,
                                                                                fontSize: 16.0),
                                                                          }
                                                                      }),
                                                        }
                                                      else
                                                        {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Something went wrong",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0),
                                                        }
                                                    }),
                                          }
                                      });
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay picked_s = (await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        }))!;

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        openingtime.text = selectedTime.toString();
      });
  }
}
