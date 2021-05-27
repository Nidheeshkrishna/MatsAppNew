import 'package:flutter/material.dart';
import 'package:webapp/Pages/StaffListPage/Widgets/staffListAddPage.dart';
import 'package:webapp/Pages/StaffListPage/Widgets/staffListWidget.dart';
import 'package:webapp/Services/StaffPageService/staffListPAgeRest.dart';
import 'package:webapp/models/StaffPageModel/getStafflistModel.dart';

class StaffListPage extends StatefulWidget {
  String mobilestafflist;
  StaffListPage({required this.mobilestafflist});
  @override
  _StaffListPageState createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.grey[600],
        ),
        title: Text(
          'Staff List',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<GetStaffListModel>(
                  future: fetchstafflist('9946895323'),
                  builder: (BuildContext context,
                      AsyncSnapshot<GetStaffListModel> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.result.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StaffListPageWidget(
                              staffphoto:
                                  snapshot.data!.result[index].staffPhoto,
                              staffname:
                                  snapshot.data!.result[index].staffName == null
                                      ? snapshot.data!.result[2].staffName
                                      : snapshot.data!.result[index].staffName,
                              businessaddress:
                                  snapshot.data!.result[index].businessAddress,
                            );
                          });
                    } else
                      return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        label: Text('Add Staff', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StaffListAddPage()),
          );
        },
      ),
    );
  }
}
