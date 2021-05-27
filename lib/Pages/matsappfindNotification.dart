import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webapp/Services/declineRest.dart';
import 'package:webapp/Services/raisedhandRest.dart';

class MatsAppNotificationFind extends StatefulWidget {
  String name, contactNumber, logofind, date;
  MatsAppNotificationFind(
      {required this.name,
      required this.contactNumber,
      //required this.description,
      required this.logofind,
      required this.date});
  @override
  _MatsAppNotificationFindState createState() =>
      _MatsAppNotificationFindState();
}

class _MatsAppNotificationFindState extends State<MatsAppNotificationFind> {
  late bool raisehandstatus;
  late bool declinestatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.contactNumber,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                widget.date,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                'We need to know more about what your API is expecting. If the request in',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Card(
                                elevation: 5,
                                child: Center(
                                  child: CachedNetworkImage(
                                    imageUrl: widget.logofind,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                          child: RaisedButton(
                              color: Colors.white,
                              child: Container(
                                  padding: EdgeInsets.only(left: 40, right: 40),
                                  child: Text(
                                    'Raised Hand',
                                    style: TextStyle(color: Colors.green),
                                  )),
                              onPressed: () {
                                fetchraisehand('8289845141', '3')
                                    .then((value) =>
                                        raisehandstatus = value.result)
                                    .whenComplete(() => {
                                          if (raisehandstatus == true)
                                            {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Your request has been accepted",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0),
                                            }
                                          else
                                            {
                                              Fluttertoast.showToast(
                                                  msg: "Please try again",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0),
                                            }
                                        });
                              })),
                      SizedBox(
                        width: 4,
                      ),
                      RaisedButton(
                          color: Colors.white,
                          child: Container(
                              padding: EdgeInsets.only(left: 47, right: 47),
                              child: Text(
                                'Decline',
                                style: TextStyle(color: Colors.red),
                              )),
                          onPressed: () {
                            fetchdecline('8289845141', '3')
                                .then((value) => declinestatus = value.result)
                                .whenComplete(() => {
                                      if (declinestatus == true)
                                        {
                                          Fluttertoast.showToast(
                                              msg: "Your request is declined",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0),
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
                                    });
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
