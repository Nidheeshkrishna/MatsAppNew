import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webapp/Pages/StaffListPage/Widgets/staffListPage.dart';
import 'package:webapp/Pages/addImage.dart';
import 'package:webapp/Pages/addoffers.dart';

import 'package:webapp/Pages/matsappfindtabedpage.dart';
import 'package:webapp/Pages/noticationPage.dart';

import 'package:webapp/Pages/redeamrequesttabedpage.dart';

import 'package:webapp/Pages/storeMarchant.dart';
import 'package:webapp/Pages/validation.dart';
import 'package:webapp/widgets/homewidget.dart';

class HomePage extends StatefulWidget {
  var mobile = '8592052604';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 130,
                      height: 130,
                      padding: EdgeInsets.all(20),
                      child: Image.asset('images/icn.png')),
                  Container(
                      height: 150,
                      width: 80,
                      child: InkWell(
                        child: Icon(Icons.notification_important_outlined),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                        },
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 75),
              child: Text(
                'Welcome to Dashboard',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset('images/homehead.png')),
                Positioned(
                    top: 110,
                    left: 130,
                    child: Text('lorem ipsum dolor sit armet lorem')),
                Positioned(
                  top: 160,
                  left: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Stack(children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                                color: Colors.red,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 15, bottom: 15),
                                    child: Text('Redeem request')),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RedeamrequestTabedpage(
                                                  mobile: widget.mobile)));
                                }),
                          ),
                        ),
                        Positioned(
                          bottom: 43,
                          left: 146,
                          child: CircleAvatar(
                            backgroundColor: Colors.orange[400],
                            radius: 10,
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(
                        width: 37,
                      ),
                      Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RaisedButton(
                                  color: Colors.red,
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 8,
                                          top: 15,
                                          bottom: 15),
                                      child: Text('MatsApp Find')),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MatsAppFindTabbedpage()));
                                  }),
                            ),
                          ),
                          Positioned(
                            bottom: 38,
                            left: 129,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange[400],
                              radius: 10,
                              child: Text(
                                '6',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: HomeWidget(
                          cardhead1: 'Your Store ',
                          image: 'images/shops.png',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreMarchant()),
                          );
                        },
                      ),
                      InkWell(
                        child: HomeWidget(
                          cardhead1: 'Validate',
                          image: 'images/validate.png',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Validation()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: HomeWidget(
                          cardhead1: 'Add Offers',
                          image: 'images/addimage.png',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Addoffers()));
                        },
                      ),
                      InkWell(
                        child: HomeWidget(
                          cardhead1: 'Add Image',
                          image: 'images/shops.png',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddImage()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: HomeWidget(
                          cardhead1: 'Staff List',
                          image: 'images/Stafflist.png',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StaffListPage(
                                        mobilestafflist: widget.mobile,
                                      )));
                        },
                      ),
                      InkWell(
                        child: Stack(children: [
                          HomeWidget(
                            cardhead1: 'Merchant Cloud',
                            image: 'images/availablesoon.png',
                          ),
                          Positioned(
                              top: 90,
                              left: 40,
                              child: Text(
                                'Available soon',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ))
                        ]),
                      ),
                    ],
                  ),
                  Stack(children: [
                    HomeWidget(
                      cardhead1: 'Reports and Analytics',
                      image: 'images/availablesoon.png',
                    ),
                    Positioned(
                        top: 90,
                        left: 40,
                        child: Text(
                          'Available soon',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ))
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
