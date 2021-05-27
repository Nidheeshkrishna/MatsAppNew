import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/loginPage.dart';
import 'package:webapp/Pages/noticationPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 181, 23, 1),
        title: Text(
          'MatsApp Bussiness',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Icon(
                  Icons.notification_important,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      final SharedPreferences localstorage =
                          await SharedPreferences.getInstance();
                      localstorage.remove('mobile');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
              ),
            ],
          ),
        ],
      ),
      body: Container(
          child: WebView(
        initialUrl: 'http://admindemo.matsapp.in/Admin/MerchantIndex',
      )),
    );
  }
}
