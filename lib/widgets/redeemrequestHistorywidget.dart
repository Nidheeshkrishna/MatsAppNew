import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RedeemrequestHistoryWidget extends StatefulWidget {
  String customerName, mobile, transactionDate, discount, couponValue, status;
  RedeemrequestHistoryWidget(
      {required this.customerName,
      required this.mobile,
      required this.transactionDate,
      required this.discount,
      required this.couponValue,
      required this.status});
  @override
  _RedeemrequestHistoryWidgetState createState() =>
      _RedeemrequestHistoryWidgetState();
}

class _RedeemrequestHistoryWidgetState
    extends State<RedeemrequestHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            Container(
              width: 40,
              height: 4,
              color: Colors.orange,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.status), Text(widget.transactionDate)],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [Text(widget.customerName), Text(widget.mobile)],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(26.0),
                          bottomRight: Radius.circular(26)),
                    )),
                Positioned(
                  top: 35,
                  left: 30,
                  child: Text(
                    widget.discount,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 53,
                  left: 97,
                  child: Text(
                    'Discount',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Positioned(
                    top: 35,
                    left: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coupon Value',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          widget.couponValue,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
