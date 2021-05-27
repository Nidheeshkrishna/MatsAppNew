import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:webapp/Services/addImageService.dart';
import 'package:webapp/Services/deleteImageService.dart';
import 'package:webapp/Services/getBusinessesOfMerchantService.dart';
import 'package:webapp/Services/getImageService.dart';
import 'package:webapp/models/businessesOfMerchantModel.dart';
import 'package:webapp/models/getImageModel.dart';

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Future getData() async {
    await getBusinessesOfMerchant("9946895323").then((value) => {
          _mySelection = value.result[0].businessId.toString(),
        });
    setState(() {
      getImageFuture = getImages(_mySelection);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  bool uploaded = false;
  late Future<GetImageModel> getImageFuture;
  String _path = "";
  File imageFile = File('');
  late BusinessesOfMerchantModel businessData;
  String iD = "";
  int valid = 0, imageCounter = 0;
  String _mySelection = "", qrData = "";
  static late MediaQueryData _mediaQueryData;
  static double screenheight = _mediaQueryData.size.height;
  static double screenwidth = _mediaQueryData.size.width;
  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[700],
              title: Text("ADD IMAGES"),
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: true,
            ),
            backgroundColor: Colors.yellow[700],
            body: Container(
              height: screenheight,
              width: screenwidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: FutureBuilder<BusinessesOfMerchantModel>(
                          future: getBusinessesOfMerchant("9946895323"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              getImageFuture = getImages(_mySelection);
                              businessData = snapshot.data!;
                              var businessList = businessData.result.toList();
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                width: (screenwidth / 100) * 80,
                                height: (screenheight / 100) * 6,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text("Select Store Here"),
                                    items: businessList.map((item) {
                                      iD = item.businessId.toString();
                                      return new DropdownMenuItem(
                                          child: new Text(item.businessName),
                                          value: iD);
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _mySelection = value.toString();
                                        getImageFuture =
                                            getImages(_mySelection);
                                      });
                                    },
                                    value: _mySelection,
                                  ),
                                ),
                              );
                            } else
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          width: (screenwidth / 100) * 70,
                          height: (screenheight / 100) * 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.white),
                          child: Stack(children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _showOptions(context);
                                      },
                                      child: Container(
                                        width: (screenwidth / 100) * 70,
                                        height: (screenheight / 100) * 18,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                            ),
                                            color: Colors.white),
                                        child: (imageFile != null)
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                                child: Image.file(
                                                  imageFile,
                                                  height:
                                                      (screenheight / 100) * 18,
                                                  width:
                                                      (screenwidth / 100) * 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Icon(
                                                Icons.add_a_photo,
                                                size: 50,
                                              ),
                                      ),
                                    ),
                                    Container(
                                      width: (screenwidth / 100) * 70,
                                      height: (screenheight / 100) * 7,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0),
                                          ),
                                          color: Colors.yellow[700]),
                                      child: TextButton(
                                          onPressed: () {
                                            if (imageCounter <= 10) {
                                              AddImages(_mySelection, _path,
                                                      "8289845141")
                                                  .then((value) => {
                                                        uploaded =
                                                            (value!.result == 1)
                                                      })
                                                  .whenComplete(() =>
                                                      getImageFuture =
                                                          getImages(
                                                              _mySelection));
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Upload",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.cloud_upload_outlined,
                                                  color: Colors.white)
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("$imageCounter/10",
                                      style: TextStyle(color: Colors.white))),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Added Images"))),
                            Container(
                                child: IconButton(
                                    icon: Icon(Icons.refresh),
                                    onPressed: () {
                                      getImageFuture = getImages(_mySelection);
                                    })),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: FutureBuilder<GetImageModel>(
                              future: getImageFuture = getImages(_mySelection),
                              builder: (BuildContext context,
                                  AsyncSnapshot<GetImageModel> snapshot) {
                                if (snapshot.hasData) {
                                  imageCounter = snapshot.data!.result.length;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Container(
                                      height: (screenheight / 100) * 50,
                                      child: ListView.builder(
                                          itemCount:
                                              snapshot.data!.result.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              color: Colors.white,
                                              height: (screenheight / 100) * 15,
                                              child: Center(
                                                child: ListTile(
                                                  leading: Container(
                                                    height:
                                                        (screenheight / 100) *
                                                            15,
                                                    width: (screenwidth / 100) *
                                                        25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                        color: Colors.white),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: Image.network(
                                                        "http://admindemo.matsapp.in" +
                                                            snapshot
                                                                .data!
                                                                .result[index]
                                                                .imgUrl
                                                                .toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  trailing: IconButton(
                                                    icon: Icon(Icons
                                                        .delete_outline_outlined),
                                                    onPressed: () {
                                                      DeleteImages(snapshot
                                                              .data!
                                                              .result[index]
                                                              .imgId
                                                              .toString())
                                                          .whenComplete(() =>
                                                              imageCounter =
                                                                  imageCounter -
                                                                      1);
                                                      setState(() {
                                                        getImageFuture =
                                                            getImages(
                                                                _mySelection);
                                                      });
                                                    },
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  );
                                } else
                                  return Text("No Added Images");
                              })),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    // show the camera
                    _showCamera();
                    //  _showPhotoLibrary();
                    print("tap");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Choose from Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _showPhotoLibrary();
                    print("tap");
                  },
                )
              ]));
        });
  }

  void _showPhotoLibrary() async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _path = pickedFile!.path;
      imageFile = File(pickedFile.path);
    });
    print(_path);
  }

  void _showCamera() async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _path = pickedFile!.path;
      imageFile = File(pickedFile.path);
    });
  }
}
