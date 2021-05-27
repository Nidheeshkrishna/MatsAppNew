import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webapp/Services/redeemrequestApproveRest.dart';
import 'package:webapp/Services/redeemrequestDeclineRest.dart';

class RedeamrequestWidget extends StatefulWidget {
  int transactionID;
  String name,
      phoneNumber,
      date,
      couponcode,
      billingamount,
      discount,
      couponvalue,
      logo,
      validitydate;
  RedeamrequestWidget(
      {required this.name,
      required this.phoneNumber,
      required this.date,
      required this.couponcode,
      required this.billingamount,
      required this.discount,
      required this.couponvalue,
      required this.logo,
      required this.validitydate,
      required this.transactionID});
  @override
  _RedeamrequestWidgetState createState() => _RedeamrequestWidgetState();
}

class _RedeamrequestWidgetState extends State<RedeamrequestWidget> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.phoneNumber,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CODE :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 25),
                    ),
                    Text(
                      widget.couponcode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 25),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Billing Amount :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.billingamount,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    'images/Group 4067.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  Positioned(
                      left: 35,
                      top: 60,
                      child: Text(
                        widget.discount,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Positioned(
                      left: 40,
                      top: 100,
                      child: Text(
                        'Discount',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      left: 125,
                      top: 17,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Container(
                            margin:
                                EdgeInsets.only(right: 12, top: 10, left: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Coupon Value'),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs.',
                                              style: TextStyle(fontSize: 35),
                                            ),
                                            Text(
                                              widget.couponvalue,
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                        OutlineButton(
                                          padding: EdgeInsets.only(
                                              left: 40,
                                              right: 40,
                                              top: 2,
                                              bottom: 2),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0)),
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          onPressed: () {},
                                          borderSide: BorderSide(
                                            color: Colors
                                                .black, //Color of the border
                                            style: BorderStyle
                                                .solid, //Style of the border
                                            width: 1, //width of the border
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        width: 80,
                                        height: 80,
                                        child: Card(
                                          margin: EdgeInsets.all(6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: widget.logo,
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  widget.validitydate,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[800]),
                                )
                              ],
                            ),
                          )))
                ],
              )
            ],
          ),
        ),
        Card(
          elevation: 5,
          child: Row(
            children: [
              RaisedButton(
                  color: Colors.white,
                  child: Container(
                      padding: EdgeInsets.only(left: 47, right: 47),
                      child: Text(
                        'Approve',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      )),
                  onPressed: () {
                    fetchredeemApprove(widget.transactionID)
                        .then((value) => status = value.result)
                        .whenComplete(() => {
                              if (status == 1)
                                {
                                  Fluttertoast.showToast(
                                      msg: "Your request has been Approved ",
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
                                      msg:
                                          "Your  Approval not accepted please try again ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                }
                            });
                  }),
              SizedBox(
                width: 2,
              ),
              RaisedButton(
                  color: Colors.white,
                  child: Container(
                      padding: EdgeInsets.only(left: 47, right: 47),
                      child: Text(
                        'Decline',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )),
                  onPressed: () {
                    fetchredeemDecline(widget.transactionID)
                        .then((value) => status = value.result)
                        .whenComplete(() => {
                              if (status == 1)
                                {
                                  Fluttertoast.showToast(
                                      msg: "Your request has been Declined ",
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
                                      msg:
                                          "Your  Decline not accepted please try again ",
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
    );
  }
}
