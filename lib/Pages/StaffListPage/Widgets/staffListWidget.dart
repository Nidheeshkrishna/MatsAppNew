import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webapp/Pages/StaffListPage/Widgets/staffListAddPage.dart';
import 'package:webapp/Pages/completeBusinessProfile.dart';
import 'package:webapp/Pages/storePreviewPage.dart';

class StaffListPageWidget extends StatefulWidget {
  dynamic staffphoto, staffname, businessaddress;

  StaffListPageWidget(
      {required this.staffphoto,
      required this.staffname,
      required this.businessaddress});
  @override
  _StaffListPageWidgetState createState() => _StaffListPageWidgetState();
}

class _StaffListPageWidgetState extends State<StaffListPageWidget> {
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
                      child: CachedNetworkImage(imageUrl: widget.staffphoto),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(widget.staffname),
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
                              builder: (context) => StaffListAddPage()),
                        );
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
                            'Call',
                            style: TextStyle(color: Colors.blue),
                          )),
                      onPressed: () {})
                ],
              )
            ],
          ),
        ));
  }
}
