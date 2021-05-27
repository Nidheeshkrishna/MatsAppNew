import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webapp/Pages/addoffers.dart';

import 'package:webapp/Services/AddStaffRest.dart';
import 'package:webapp/Services/GetBusinessOfMerchantRest.dart';
import 'package:webapp/models/AddStaffModel.dart';
import 'package:webapp/models/GetBusinessOfMerchantModel.dart';

class Addstaff extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Addstaff> {
  late PickedFile imageFile;
  Dio dio = new Dio();
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Future<AddStaffModel> addstaff1;
  late Future<GetBusinessOfMerchantModel> fetchbusinessmerchant;
  String mobnum = "9946895323";
  String _businessstore = '';
  late int status;
  late File _image;
  String imagepath = "";
  int storeId = 105218;
  bool uploaded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchbusinessmerchant = fetchbusinesofmerchant(mobnum);
      //storeId = _businessstore;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Addoffers()));
        },
      ),
      title: Text('Staffs List',
          style: TextStyle(
              fontFamily: 'Schyler', fontSize: 15.0, color: Colors.grey)),
      actions: <Widget>[],
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appbar,
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              // ignore: deprecated_member_use
              autovalidate: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text("Staff Image",
                                style: TextStyle(
                                    fontFamily: 'Schyler',
                                    fontSize: 15.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 30.0),
                            child: Card(
                              elevation: 5,
                              // child: image != null ? Image.file(File(image)) : null(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // _uploadImage();
                                      _showSelectionDialog(context);
                                    },
                                    child: Column(
                                      /// mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _image != null
                                            ? Image.file(
                                                _image,
                                                height: 90,
                                                width: width * .60,
                                                fit: BoxFit.fill,
                                              )
                                            : Image.asset(
                                                'assets/images/img.png',
                                                height: 90,
                                                width: width * .60,
                                                fit: BoxFit.fill,
                                              ),
                                        Image.asset(
                                          'assets/images/upload.png',
                                          height: 30,
                                          width: width * .60,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * .80,
                        height: height * .10,
                        child: FutureBuilder<GetBusinessOfMerchantModel>(
                            future: fetchbusinesofmerchant(mobnum),
                            builder: (context,
                                AsyncSnapshot<GetBusinessOfMerchantModel>
                                    snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  width: width * .70,
                                  height: height * .10,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: 'Select Store',
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0)),
                                        borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                    ),
                                    value: _businessstore,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Store is required';
                                      }
                                      return null;
                                    },
                                    items: snapshot.hasData
                                        ? snapshot.data!.result
                                            .map<DropdownMenuItem<String>>(
                                                (var val) {
                                            return DropdownMenuItem<String>(
                                              value: val != null
                                                  ? val.businessId.toString()
                                                  : null,
                                              child: Text(val.businessName),
                                            );
                                          }).toList()
                                        : null,
                                    onChanged: (val2) {
                                      setState(() {
                                        _businessstore = val2.toString();
                                      });
                                    },
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * .80,
                        height: height * .10,
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter Staff Name' : null,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Staff Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * .80,
                        height: height * .10,
                        child: TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: mobileController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Phone Number',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * .80,
                        height: height * .10,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) => value!.isEmpty
                              ? 'Enter Your Email'
                              : validateEmail(value),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Email ID',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width * .80,
                          height: height * .10,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter Staff Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                                borderSide: BorderSide(
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: width * .90,
                      height: height * .05,
                      child: RaisedButton(
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          // addstaffreg(
                          //     _businessstore,
                          //     nameController.text,
                          //     mobileController.text,
                          //     emailController.text,
                          //     passwordController.text,
                          //     mobnum,
                          //     imagepath);
                          addstaffreg(
                              _businessstore,
                              nameController.text,
                              mobileController.text,
                              emailController.text,
                              passwordController.text,
                              mobnum,
                              imagepath);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  showMessages(String messages) async {
    Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightBlue[700],
        textColor: Colors.white);
  }

  Future<void> _showSelectionDialog(BuildContext contex) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Future<void> _openGallery(BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      // if (pickedFile != null) {
      imagepath = pickedFile!.path;
      _image = File(pickedFile.path);
      // } else {

      // }
    });
    print(imagepath);
    Navigator.of(context).pop();
  }

  Future<void> _openCamera(BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      // if (pickedFile != null) {
      _image = File(pickedFile!.path);
      imagepath = pickedFile.path;
      // } else {
      // print('No image selected.');
      // }
    });
    Navigator.of(context).pop();
  }
}
