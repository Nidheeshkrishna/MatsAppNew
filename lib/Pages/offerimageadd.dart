import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:webapp/Services/AddOfferRest.dart';

class Offerimageadd extends StatefulWidget {
  final String _mySelection;
  final String _ofrcatsele;
  final String _subcatofr;
  final String _currentSelectedValue;
  // final int spaceId;
  // final String userId;
  final String offername;
  final String mrp;
  final String shopdiscount;
  final String offerprice;
  final String offerstartdate;
  final String offerenddate;
  final String description;
  final String specification;
  final String imagepath;
  Offerimageadd(
    this.offername,
    this.mrp,
    this.shopdiscount,
    this.offerprice,
    this.offerstartdate,
    this.offerenddate,
    this.description,
    this.specification,
    this._mySelection,
    this._ofrcatsele,
    this._subcatofr,
    this._currentSelectedValue,
    this.imagepath,
  );

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Offerimageadd> {
  List<Asset> images = <Asset>[];
  late String _error;
  String mobile = "8289845141";
  String id = "";

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    if (images != null)
      return GridView.count(
        crossAxisCount: 1,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 700,
            height: 1500,
          );
        }),
      );
    else {
      return Container(color: Colors.white);
    }
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

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          title: Text('ADD OFFER BANNER IMAGE',
              style: TextStyle(
                  fontFamily: 'Schyler', fontSize: 15.0, color: Colors.white)),
          actions: <Widget>[],
        ),
        body: Column(
          children: <Widget>[
            //   Center(child: Text('Error: $_error')),
            RaisedButton(
              child: Text(
                "PICK IMAGES",
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
              ),
              color: Colors.orangeAccent,
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: RaisedButton(
                  child: Text(
                    '          UPLOAD            ',
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.normal),
                  ),
                  color: Colors.orangeAccent,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  onPressed: () {
                    addofferupload(
                      mobile,
                      id,
                      widget.offername,
                      widget.mrp,
                      widget.shopdiscount,
                      widget.offerprice,
                      widget.offerstartdate,
                      widget.offerenddate,
                      widget.description,
                      widget.specification,
                      widget._mySelection,
                      widget._ofrcatsele,
                      widget._subcatofr,
                      widget._currentSelectedValue,
                      widget.imagepath,
                      // images,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
