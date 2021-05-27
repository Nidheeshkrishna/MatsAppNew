import 'package:flutter/material.dart';
import 'package:webapp/Pages/redeamrequestHistorypage.dart';
import 'package:webapp/Pages/redeamrequestpage.dart';

class RedeamrequestTabedpage extends StatefulWidget {
  String mobile;
  RedeamrequestTabedpage({this.mobile = ''});
  @override
  _RedeamrequestTabedpageState createState() => _RedeamrequestTabedpageState();
}

class _RedeamrequestTabedpageState extends State<RedeamrequestTabedpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                centerTitle: true,
                title: Text(
                  'Redeam Request',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                bottom: TabBar(
                  indicatorColor: Colors.orange,
                  tabs: [
                    Tab(
                      icon: Text(
                        'Active Request',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      text: 'Active Request',
                    ),
                    Tab(
                      icon: Text(
                        'History',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      text: 'History',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Redeamrequestpage(
                    mobile: widget.mobile,
                  ),
                  RedeemRe()
                ],
              ),
            ),
          ),
        ));
  }
}
