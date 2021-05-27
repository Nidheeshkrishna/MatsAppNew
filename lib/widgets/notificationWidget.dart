import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  Color dividercolor, avatarcolor;
  String notificationtitle, notificationmessege, time;
  NotificationWidget(
      {required this.dividercolor,
      required this.avatarcolor,
      required this.notificationtitle,
      required this.notificationmessege,
      required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationtitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      notificationmessege,
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
              Container(
                  child: Text(
                time,
                style: TextStyle(fontSize: 4),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
