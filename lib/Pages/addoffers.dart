import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:webapp/Pages/addstaff.dart';
import 'package:webapp/Pages/offerimageadd.dart';
import 'package:webapp/Services/BusinessNameRest.dart';
import 'package:webapp/Services/GetOfferCategoryRest.dart';
import 'package:webapp/Services/GetOfferSubCatRest.dart';
import 'package:webapp/models/BusinessnameModel.dart';
import 'package:webapp/models/GetOfferCategoryModel.dart';
import 'package:webapp/models/GetOfferSubCatModel.dart';

class Addoffers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Addoffers> {
  List<Asset> images = <Asset>[];
  String _error = '';
  String imagepath = '';
  late PickedFile imageFile;
  Dio dio = new Dio();
  final _formKey = GlobalKey<FormState>();
  File _image = File('');
  File _images = File('');
  final picker = ImagePicker();
  final offernameController = TextEditingController();
  final mrpController = TextEditingController();
  final shopdiscountController = TextEditingController();
  final offerpriceController = TextEditingController();
  final offerstartdateController = TextEditingController();
  final offerenddateController = TextEditingController();
  final descriptionController = TextEditingController();
  final specificationController = TextEditingController();
  String _mySelection = '';
  String _ofrcatsele = '';
  String _subcatofr = '';
  String _currentSelectedValue = '';
  // String _selectedDate;
  late DateTime pickedDate;
  late DateTime _selectedDate;
  late DateTime _selectedDate1;
  late String dateofBirth;
  var _currencies = ["Percentage %", "In Rupees ₹"];
  late Future<BusinessnameModel> fetchbusinessname1;
  late Future<GetOfferCategoryModel> fetchoffercategory;
  late Future<GetOfferSubCatModel> fetchofrsub;
  String mobnum = "9946895323";
  String userid = "1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchbusinessname1 = fetchbusinessname(mobnum);
      fetchoffercategory = fetchoffercat();
      fetchofrsub = fetchoffersub(userid);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppBar appbar = AppBar(
      backgroundColor: Colors.orangeAccent,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {},
      ),
      title: Text('ADD OFFERS',
          style: TextStyle(
              fontFamily: 'Schyler', fontSize: 15.0, color: Colors.white)),
      actions: <Widget>[],
    );

    return Scaffold(
        appBar: appbar,
        body: Container(
          color: Colors.orangeAccent,
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              // ignore: deprecated_member_use
              autovalidate: true,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Offer Image"),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Card(
                                elevation: 5,
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
                                                  height: 45,
                                                  width: width * .40,
                                                  fit: BoxFit.fill,
                                                )
                                              :
                                              // Icon(Icons.upload_file),
                                              Image.asset(
                                                  'assets/images/img.png',
                                                  height: 65,
                                                  width: width * .40,
                                                  fit: BoxFit.fill,
                                                ),
                                          Image.asset(
                                            'assets/images/upload.png',
                                            height: 25,
                                            width: width * .40,
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
                        Column(
                          children: [
                            Text("Offer Banner Image"),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 98,
                                width: width * .40,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Offerimageadd(
                                                        offernameController
                                                            .text,
                                                        mrpController.text,
                                                        shopdiscountController
                                                            .text,
                                                        offerpriceController
                                                            .text,
                                                        offerstartdateController
                                                            .text,
                                                        offerenddateController
                                                            .text,
                                                        descriptionController
                                                            .text,
                                                        specificationController
                                                            .text,
                                                        _mySelection,
                                                        _ofrcatsele,
                                                        _subcatofr,
                                                        _currentSelectedValue,
                                                        imagepath,
                                                      )));
                                        },
                                        child: Column(
                                          /// mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _images != null
                                                ? Image.file(
                                                    _images,
                                                    height: 45,
                                                    width: width * .40,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'assets/images/img.png',
                                                    height: 65,
                                                    width: width * .40,
                                                    fit: BoxFit.fill,
                                                  ),
                                            Image.asset(
                                              'assets/images/upload.png',
                                              height: 25,
                                              width: width * .40,
                                              fit: BoxFit.fill,
                                            ),
                                            // Center(child: Text('Error: $_error')),
                                            // RaisedButton(
                                            //   child: Text("Pick images"),
                                            //   onPressed: loadAssets,
                                            // ),
                                            // Expanded(
                                            //   child: buildGridView(),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FutureBuilder<BusinessnameModel>(
                            future: fetchbusinessname1,
                            builder: (context,
                                AsyncSnapshot<BusinessnameModel> snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, top: 10.0),
                                  child: Container(
                                    width: width * .90,
                                    height: height * .10,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        labelText: 'Business Name',
                                        labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
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
                                      value: _mySelection,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Business Name is required';
                                        }
                                        return null;
                                      },
                                      //   hint: Text("--Business Name--"),
                                      items: snapshot.hasData
                                          ? snapshot.data!.result
                                              .map<DropdownMenuItem<String>>(
                                                  (var value1) {
                                              return DropdownMenuItem<String>(
                                                value: value1 != null
                                                    ? value1.businessId
                                                        .toString()
                                                    : null,
                                                child:
                                                    Text(value1.businessName),
                                              );
                                            }).toList()
                                          : null,
                                      onChanged: (value2) {
                                        setState(() {
                                          _mySelection = value2.toString();
                                        });
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: offernameController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Offer Name' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Offer Name',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter offer name here',
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
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: mrpController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter MRP' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'MRP (In Rs)',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter price here',
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
                          width: width * .40,
                          height: height * .10,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Discount Type',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter price here',
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
                            // hint: Text('Choos Discount type'),
                            value: _currentSelectedValue,
                            onChanged: (newValue) {
                              setState(() {
                                _currentSelectedValue = newValue.toString();
                              });
                            },
                            items: _currencies.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: shopdiscountController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Discount ' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Shop Discount(In %)',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter price here',
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
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: offerpriceController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Offer Price' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Offer Price',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter offer price here',
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
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: FutureBuilder<GetOfferCategoryModel>(
                              future: fetchoffercat(),
                              builder: (context,
                                  AsyncSnapshot<GetOfferCategoryModel>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    width: width * .70,
                                    height: height * .10,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        labelText: 'Offer Category',
                                        labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                        //  hintText: 'Select Business',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
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
                                      value: _ofrcatsele,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Offer category is required';
                                        }
                                        return null;
                                      },
                                      items: snapshot.hasData
                                          ? snapshot.data!.result
                                              .map<DropdownMenuItem<String>>(
                                                  (var val) {
                                              return DropdownMenuItem<String>(
                                                value: val != null
                                                    ? val.offerCategoryId
                                                        .toString()
                                                    : null,
                                                child:
                                                    Text(val.offerCategoryName),
                                              );
                                            }).toList()
                                          : null,
                                      onChanged: (val2) {
                                        setState(() {
                                          _ofrcatsele = val2.toString();
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
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FutureBuilder<GetOfferSubCatModel>(
                            future: fetchofrsub,
                            builder: (context,
                                AsyncSnapshot<GetOfferSubCatModel> snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 18.0),
                                  child: Container(
                                    width: width * .40,
                                    height: height * .10,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        labelText: 'Sub Category',
                                        labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                        //  hintText: 'Select Business',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
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
                                      value: _subcatofr,
                                      validator: (valuofr) {
                                        if (valuofr == null) {
                                          return 'Subcategory is required';
                                        }
                                        return null;
                                      },
                                      items: snapshot.hasData
                                          ? snapshot.data!.result
                                              .map<DropdownMenuItem<String>>(
                                                  (var valuofr1) {
                                              return DropdownMenuItem<String>(
                                                value: valuofr1 != null
                                                    ? valuofr1.ofrscCatgId
                                                        .toString()
                                                    : null,
                                                child: Text(
                                                    valuofr1.ofrscSubCatgName),
                                              );
                                            }).toList()
                                          : null,
                                      onChanged: (valuofr2) {
                                        setState(() {
                                          _subcatofr = valuofr2.toString();
                                        });
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: offerstartdateController,
                            onTap: () async {
                              _pickDateDialog(context);
                            },
                            validator: (value) =>
                                value!.isEmpty ? 'Enter price here' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Offer Start Date',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter price here',
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
                        Container(
                          width: width * .40,
                          height: height * .10,
                          child: TextFormField(
                            controller: offerenddateController,
                            onTap: () async {
                              _pickDateDialogone(context);
                            },
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Disocunt Type' : null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Offer End Date',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter Disocunt Type',
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
                          width: width * .90,
                          height: height * .10,
                          child: TextFormField(
                            controller: descriptionController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Offer name here' : null,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              labelText: 'Description',
                              labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter Offer name here',
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
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * .90,
                            height: height * .10,
                            child: TextFormField(
                              controller: specificationController,
                              validator: (value) => value!.isEmpty
                                  ? 'Enter Offer name here'
                                  : null,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                labelText: 'Specification',
                                labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                                hintText: 'Enter Offer name here',
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
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            // addstaff();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addstaff()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagepath = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagepath = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> loadAssets() async {
    setState(() {
      images = <Asset>[];
    });

    List<Asset> resultList = [];
    String error = '';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  Widget buildGridView() {
    if (images != null)
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 100,
            height: 100,
          );
        }),
      );
    else
      return Container(color: Colors.white);
  }

  void _pickDateDialog(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2050))
//            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        offerstartdateController.text =
            DateFormat("dd/MM/yyyy").format(_selectedDate).toString();
        dateofBirth = DateFormat("yyyy/MM/dd").format(_selectedDate).toString();
        print("Dobssssssssssss$dateofBirth");
      });
    });
  }

  void _pickDateDialogone(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2090))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate1 = pickedDate;
        offerenddateController.text =
            DateFormat("dd/MM/yyyy").format(_selectedDate1).toString();
        dateofBirth =
            DateFormat("yyyy/MM/dd").format(_selectedDate1).toString();
        print("Dobssssssssssss$dateofBirth");
      });
    });
  }
}
