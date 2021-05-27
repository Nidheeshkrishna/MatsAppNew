import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webapp/Pages/redeamrequestpage.dart';

import 'package:webapp/Services/ForgetPasswordRest.dart';
import 'package:webapp/widgets/TextFormfield.dart';
import 'package:webapp/Pages/loginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController mobile = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmnewpassword = TextEditingController();
  late int heightadj;
  final _formKey = GlobalKey<FormState>();
  Widget heightadjuster = SizedBox(
    height: 20,
  );
  late int forgetresult;
  bool obscureTextforgot1 = true;
  bool obscureTextforgot2 = true;
  void toggleforgot1() {
    setState(() {
      obscureTextforgot1 = !obscureTextforgot1;
    });
  }

  void toggleforgot2() {
    setState(() {
      obscureTextforgot2 = !obscureTextforgot2;
    });
  }

  String? get mobilecontroller => null;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 200,
                  child: Image.asset('images/icn.png')),
              heightadjuster,
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              heightadjuster,
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormWidget(
                          validationtext: 'Enter your mobile Number',
                          controllerobject: mobile,
                          labeltext: 'mobile Number',
                          hindtext: 'mobile Number',
                          icon: Icon(Icons.remove_red_eye),
                          formvalidator: 'Enter your mobile Number',
                          mobilelengthvalidator:
                              'Mobile number should contain 10 numbers',
                        ),
                        heightadjuster,
                        TextFormWidget(
                          validationtext: 'Enter your new password',
                          boolvalue: obscureTextforgot1,
                          controllerobject: newpassword,
                          labeltext: 'new Password',
                          hindtext: 'new Password',
                          icon: InkWell(
                              onTap: toggleforgot1,
                              child: Icon(obscureTextforgot1
                                  ? Icons.remove_done
                                  : Icons.remove_red_eye)),
                          formvalidator: 'Create Password',
                          passwordlengthvalidator:
                              'Isnt Password contain 8 charaters?',
                        ),
                        heightadjuster,
                        TextFormWidget(
                          validationtext: 'Re-enter Password',
                          controllerobject: confirmnewpassword,
                          labeltext: 'Confirm New Password',
                          hindtext: 'Confirm New Password',
                          icon: InkWell(
                              onTap: toggleforgot2,
                              child: Icon(obscureTextforgot2
                                  ? Icons.remove_done
                                  : Icons.remove_red_eye)),
                          formvalidator: 'Re-enter Password',
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color.fromRGBO(255, 181, 23, 1),
                  child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar.

                    }
                    if (newpassword.text.toString() !=
                        confirmnewpassword.text.toString()) {
                      Fluttertoast.showToast(
                          msg: 'Password does not match',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.yellow);
                    }

                    fetchForgetPassword(mobile.text, newpassword.text,
                            confirmnewpassword.text)
                        .then((value) => {forgetresult = value.result})
                        .whenComplete(() => {
                              if (forgetresult == 1)
                                {
                                  Fluttertoast.showToast(
                                      msg: 'Password matched',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow),
                                  Fluttertoast.showToast(
                                      msg: "Password change successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Color.fromRGBO(255, 181, 23, 1),
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage())),
                                  setState(() {
                                    mobile.clear();
                                    newpassword.clear();
                                    confirmnewpassword.clear();
                                  })
                                }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Something went wrong:Check your registration',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow)
                                },
                            });
                  })
            ],
          ),
        )),
      ),
    );
  }
}
