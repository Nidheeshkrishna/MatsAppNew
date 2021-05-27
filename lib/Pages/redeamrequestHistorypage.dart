import 'package:flutter/material.dart';
import 'package:webapp/Services/redeemrequesthistorywidgetRest.dart';
import 'package:webapp/models/redeemrequesthistorywidgetModel.dart';
import 'package:webapp/widgets/redeemrequestHistorywidget.dart';

class RedeemRe extends StatefulWidget {
  @override
  _RedeemReState createState() => _RedeemReState();
}

class _RedeemReState extends State<RedeemRe> {
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
              child: FutureBuilder<RedeemRequestHistoryModel>(
                  future: fetchredeemrequesthistory('8289845141'),
                  builder: (BuildContext context,
                      AsyncSnapshot<RedeemRequestHistoryModel> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.result.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RedeemrequestHistoryWidget(
                              couponValue:
                                  snapshot.data!.result[index].couponValue,
                              customerName: snapshot
                                          .data!.result[index].customerName ==
                                      null
                                  ? snapshot.data!.result[1].customerName
                                  : snapshot.data!.result[index].customerName,
                              discount: snapshot.data!.result[index].discount,
                              mobile:
                                  snapshot.data!.result[index].customerMobile,
                              status:
                                  snapshot.data!.result[index].status == null
                                      ? snapshot.data!.result[1].status
                                      : snapshot.data!.result[index].status,
                              transactionDate:
                                  snapshot.data!.result[index].transactionDate,
                            );
                          });
                    } else
                      return Center(child: CircularProgressIndicator());
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
