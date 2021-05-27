import 'package:flutter/material.dart';
import 'package:webapp/Pages/matsappfindNotification.dart';
import 'package:webapp/Pages/redeamrequestHistorypage.dart';
import 'package:webapp/Services/MatsAppFindRest.dart';
import 'package:webapp/models/MatsAppFindModel.dart';

class MatsAppFindTabbedpage extends StatefulWidget {
  @override
  _MatsAppFindTabbedpageState createState() => _MatsAppFindTabbedpageState();
}

class _MatsAppFindTabbedpageState extends State<MatsAppFindTabbedpage> {
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
                  'MatsApp Find',
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
                        'Find Notification',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      text: 'Find Notification',
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
                  FutureBuilder<MatsAppFindModel>(
                      future: fetchMatsAppFind('8289845141'),
                      builder: (BuildContext context,
                          AsyncSnapshot<MatsAppFindModel> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.result.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MatsAppNotificationFind(
                                  date: snapshot.data!.result[index].date,
                                  contactNumber:
                                      snapshot.data!.result[index].phoneNumber,
                                  logofind:
                                      snapshot.data!.result[index].imageUrl,
                                  name:
                                      snapshot.data!.result[index].customerName,
                                );
                              });
                        } else
                          return Center(child: CircularProgressIndicator());
                      }),
                  RedeemRe()
                ],
              ),
            ),
          ),
        ));
  }
}
