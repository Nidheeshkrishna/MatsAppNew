import 'package:flutter/material.dart';
import 'package:webapp/Services/notificationRest.dart';
import 'package:webapp/models/notificationmodel.dart';
import 'package:webapp/widgets/notificationWidget.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late int index;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Misc Notifications',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        body: FutureBuilder<NotificationListModel>(
          future: fetchNotification('9946895323'),
          builder: (BuildContext context,
              AsyncSnapshot<NotificationListModel> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.result.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationWidget(
                    dividercolor: Colors.orange,
                    avatarcolor: Colors.orange,
                    notificationtitle:
                        snapshot.data!.result[index].notificationMessageTittle,
                    notificationmessege:
                        snapshot.data!.result[index].notificationMessage,
                    time: snapshot.data!.result[index].notificationDate,
                  );
                });
          },
        ));
  }
}
