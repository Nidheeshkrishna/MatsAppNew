import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webapp/widgets/BusinessprofTextForem.dart';
import 'package:webapp/widgets/ImageUploadWidget.dart';
import 'package:webapp/widgets/dropdownFormfield.dart';

class StaffListAddPage extends StatefulWidget {
  @override
  _StaffListAddPageState createState() => _StaffListAddPageState();
}

class _StaffListAddPageState extends State<StaffListAddPage> {
  File imageFilestaff = File('');
  TextEditingController staffname = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String path = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.grey[600]),
        title: Text(
          'Staff List',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ImageUploadWidget(
              headtext: 'Staff Image',
              imageFile: imageFilestaff,
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
                                final pickedFilelogo = await pickerlogo
                                    .getImage(source: ImageSource.gallery);
                                setState(() {
                                  path = pickedFilelogo!.path;
                                  imageFilestaff = File(pickedFilelogo.path);
                                });
                                print(path);
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
                                final pickedFile = await _picker.getImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  path = pickedFile!.path;
                                  imageFilestaff = File(pickedFile.path);
                                });
                                print(path);
                              },
                            )
                          ]));
                    });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: DropdownformField(
                hindtext: 'Select Store Here',
                labeltext: 'Select Store',
              ),
            ),
            BusinessProfileTextform(
              minline: 1,
              maxline: 1,
              labeltext: 'Name',
              hindtext: 'Enter Staff Name',
              controllerobject: staffname,
            ),
            BusinessProfileTextform(
              minline: 1,
              maxline: 1,
              labeltext: 'Mobile Number',
              hindtext: 'Enter Phone Number',
              controllerobject: mobilenumber,
            ),
            BusinessProfileTextform(
              minline: 1,
              maxline: 1,
              labeltext: 'Email',
              hindtext: 'Enter Email ID',
              controllerobject: email,
            ),
            BusinessProfileTextform(
              minline: 1,
              maxline: 1,
              labeltext: 'Password',
              hindtext: 'Enter Staff Password',
              controllerobject: password,
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                color: Colors.red,
                child: Container(
                    padding: EdgeInsets.only(
                        left: 140, right: 140, top: 15, bottom: 15),
                    child: Text('Save', style: TextStyle(color: Colors.white))),
                onPressed: () {})
          ],
        ),
      )),
    );
  }
}
