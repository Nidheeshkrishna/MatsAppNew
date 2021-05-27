import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/Webviewpage1.dart';
import 'package:webapp/Pages/loginPage.dart';

class SplashPage extends StatefulWidget {
  var finalmobile;
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getvalidation().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.finalmobile == null
                      ? LoginPage()
                      : WebviewPage())));
    });
  }

  Future getvalidation() async {
    final SharedPreferences localstorage =
        await SharedPreferences.getInstance();
    var obtainmobile = localstorage.getString('mobile');
    setState(() {
      widget.finalmobile = obtainmobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * 5,
          child: Image.asset('images/icn.png'),
        ),
      ),
    );
  }
}
