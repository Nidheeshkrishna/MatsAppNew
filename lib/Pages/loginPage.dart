import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webapp/Pages/Webviewpage1.dart';
import 'package:webapp/Pages/forgotPasswordPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/homepage.dart';
import 'package:webapp/Pages/matsappfindtabedpage.dart';

import 'package:webapp/Pages/otpPage.dart';
import 'package:webapp/Pages/redeamrequestpage.dart';
import 'package:webapp/Pages/redeamrequesttabedpage.dart';
import 'package:webapp/Services/loginRest.dart';
import 'package:webapp/Utilities/generaltools.dart';
import 'package:webapp/widgets/TextFormfield.dart';

import 'package:webapp/Pages/RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  TextEditingController mobilecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  String mobileNumber = '';
  dynamic apikeyshare;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String UserMobile = '';
  bool loading = false;

  var ApiKey;

  Future init() async {}

  final _formKey = GlobalKey<FormState>();
  late bool user_status;
  late bool isload;
  late int index;
  bool obscureText = true;
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        width: 220,
                        height: 220,
                        child: Image.asset("images/icn.png"),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          'Welcome To\nMatsapp Bussiness',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.all(35),
                          child: Column(
                            children: [
                              TextFormWidget(
                                passwordvalid:
                                    widget.mobilecontroller.toString() == ''
                                        ? ''
                                        : 'Enter your Mobile Number',
                                validationtext: 'Enter your number',
                                controllerobject: widget.mobilecontroller,
                                //labeltext: 'Mobile Number',
                                hindtext: 'Mobile Number',
                                icon: Icon(Icons.mobile_friendly_outlined),
                                formvalidator: 'Enter your number',
                                mobilelengthvalidator:
                                    'Mobile Number must contain 10 numbers',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormWidget(
                                passwordvalid: 'Enter your password',
                                validationtext: 'Enter Password',
                                boolvalue: obscureText,
                                controllerobject: widget.passwordcontroller,
                                //labeltext: 'Password',
                                hindtext: 'Password',
                                icon: InkWell(
                                    onTap: toggle,
                                    child: Icon(obscureText
                                        ? Icons.remove_done
                                        : Icons.remove_red_eye)),
                                formvalidator: 'Enter Password',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: loading
                      ? LinearProgressIndicator(
                          backgroundColor: Colors.orange,
                        )
                      : Text("Press button for login",
                          style:
                              TextStyle(fontSize: 7, color: Colors.grey[600])),
                ),
                RichText(
                    text: TextSpan(
                  text: 'Forgot Password?',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          )
                        },
                )),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    color: Color.fromRGBO(255, 181, 23, 1),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        child: Container(
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        )),
                    onPressed: () {
                      setState(() {
                        loading = !loading;
                      });
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.

                      } else {
                        fetchLogin(
                                widget.mobilecontroller.text.toString(),
                                widget.passwordcontroller.text.toString(),
                                "zwWxrlNnypdGBrd7ebemk0YwsxffnULbjHuWYz9QvcaiSGlSaY7TZA7L+hYGIc54jDYhfl8TDTkvLXL9yBEX+ZEPRnw+TNjouMF5f9gNc1s=")
                            .then((value) => {
                                  user_status = value.result.status,
                                  UserMobile = value.result.phone,
                                  ApiKey = value.result.apiKey
                                })
                            .whenComplete(() => {
                                  if (user_status == true)
                                    {
                                      GeneralTools()
                                          .prefsetLoginInfo(UserMobile, ApiKey),
                                      Fluttertoast.showToast(
                                          msg: "Login successfully",
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
                                              builder: (context) =>
                                                  HomePage())),
                                      setState(() {
                                        widget.passwordcontroller.clear();
                                        loading = false;
                                      }),
                                    }
                                  else if (user_status == false)
                                    {
                                      setState(() {
                                        loading = false;
                                      }),
                                      Fluttertoast.showToast(
                                          msg:
                                              "Enter correct Username or password ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0),
                                      setState(() {
                                        widget.passwordcontroller.clear();
                                        loading = false;
                                      })
                                    }
                                });

                        setState(() {
                          widget.passwordcontroller.clear();
                        });
                      }
                    }),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'New Bussiness?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                    color: Color.fromRGBO(255, 181, 23, 1),
                    child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    }),
              ]),
        ),
      ),
    );
  }
}
