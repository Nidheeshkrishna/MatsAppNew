import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/completeBusinessProfile.dart';
import 'package:webapp/Pages/storePreviewPage.dart';

class StorePageWidget extends StatefulWidget {
  String logo, businessname, businessaddress;
  int bussinessID;
  StorePageWidget({
    required this.bussinessID,
    required this.logo,
    required this.businessname,
    required this.businessaddress,
  });

  @override
  _StorePageWidgetState createState() => _StorePageWidgetState();
}

class _StorePageWidgetState extends State<StorePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Card(
                      child: CachedNetworkImage(imageUrl: widget.logo),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(widget.businessname),
                      Text(widget.businessaddress)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 63,
                            right: 63,
                          ),
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.green),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompleteBusinessProfile(
                                      businessID: widget.bussinessID,
                                    )));
                      }),
                  SizedBox(
                      width: 3,
                      child: Container(
                        height: 35,
                        width: 4,
                        color: Colors.grey[200],
                      )),
                  RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 63,
                            right: 63,
                          ),
                          child: Text(
                            'View',
                            style: TextStyle(color: Colors.blue),
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StorePreviewPage(
                                    bussinessID: widget.bussinessID,
                                  )),
                        );
                      })
                ],
              )
            ],
          ),
        ));
  }
}
