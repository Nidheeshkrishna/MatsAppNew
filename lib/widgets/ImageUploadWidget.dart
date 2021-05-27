import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageUploadWidget extends StatefulWidget {
  String headtext;
  void Function() buttonAction;
  File imageFile = File('');
  ImageUploadWidget(
      {required this.headtext,
      required this.buttonAction,
      required this.imageFile});

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  String path = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.headtext),
        Card(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 100,
                    width: 200,
                    child: Image.file(widget.imageFile)),
                Positioned(
                    top: 60,
                    child: RaisedButton(
                        color: Color.fromRGBO(255, 181, 23, 1),
                        child: Container(
                          padding: EdgeInsets.only(left: 48, right: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upload',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.upload_file,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        onPressed: widget.buttonAction))
              ],
            ),
          ),
        )
      ],
    );
  }
}
