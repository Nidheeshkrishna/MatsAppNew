import 'package:flutter/material.dart';

import 'package:webapp/Services/redeemrequestRest.dart';
import 'package:webapp/models/redeamrequestModel.dart';
import 'package:webapp/widgets/redeamrequestwidget.dart';

class Redeamrequestpage extends StatefulWidget {
  String mobile;
  Redeamrequestpage({this.mobile = ''});
  @override
  _RedeamrequestpageState createState() => _RedeamrequestpageState();
}

class _RedeamrequestpageState extends State<Redeamrequestpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 6, right: 6),
          child: FutureBuilder<RedeemRequestModel>(
              future: fetchredeemrequest('8289845141'),
              builder: (BuildContext context,
                  AsyncSnapshot<RedeemRequestModel> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RedeamrequestWidget(
                          transactionID:
                              snapshot.data!.result[index].transactionId,
                          name: snapshot.data!.result[index].name,
                          billingamount:
                              snapshot.data!.result[index].billingAmount,
                          couponcode: snapshot.data!.result[index].couponCode,
                          couponvalue: snapshot.data!.result[index].couponValue,
                          date: snapshot.data!.result[index].validDate,
                          discount: snapshot.data!.result[index].discount,
                          logo: snapshot.data!.result[index].logoUrl,
                          phoneNumber:
                              snapshot.data!.result[index].contactNumber,
                          validitydate: snapshot.data!.result[index].validDate,
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    )));
  }
}
