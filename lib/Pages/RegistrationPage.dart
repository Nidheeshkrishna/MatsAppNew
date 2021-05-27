import 'package:flutter/material.dart';
import 'package:webapp/Pages/loginPage.dart';

import 'package:webapp/Pages/otpPage.dart';
import 'package:webapp/Services/RegistrationVerifiedRest.dart';
import 'package:webapp/Services/alreadyregisteredRest.dart';

import 'package:webapp/Services/registrationRest.dart';

import 'package:webapp/widgets/TextFormfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  bool valuefirst = false;
  bool ontap = false;
  late bool obscureText;
  TextEditingController mobilecontrollerreg = TextEditingController();
  TextEditingController passwordcontrollerreg = TextEditingController();
  TextEditingController confirmpasswordcontrollerreg = TextEditingController();
  late int userstatus;
  late bool result1;
  bool isload = false;
  late String mobile;
  late String usermobile;
  bool obscureTextreg1 = true;
  bool obscureTextreg2 = true;
  void toggle1() {
    setState(() {
      obscureTextreg1 = !obscureTextreg1;
    });
  }

  void toggle2() {
    setState(() {
      obscureTextreg2 = !obscureTextreg2;
    });
  }

  get onChanged => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var valuesecond = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Image.asset('images/icn.png'),
                ),
                Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormWidget(
                                validationtext: 'Enter your mobile number',
                                //labeltext: 'MobileNumber',
                                hindtext: 'Mobile Number',
                                formvalidator: 'Enter Mobile Number',
                                mobilelengthvalidator:
                                    'Isnt Mobile Number contain 10 numbers?',
                                icon: new Icon(Icons.mobile_friendly_rounded),
                                controllerobject: mobilecontrollerreg,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormWidget(
                                validationtext: 'Enter your  password',
                                boolvalue: obscureTextreg1,
                                //labeltext: 'Create Password',
                                hindtext: 'Create Password',
                                formvalidator: 'Create Password',
                                passwordlengthvalidator:
                                    'Isnt password contain 8 characters?',
                                icon: InkWell(
                                  onTap: toggle1,
                                  child: new Icon(obscureTextreg1
                                      ? Icons.remove_done
                                      : Icons.remove_red_eye),
                                ),
                                controllerobject: passwordcontrollerreg,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormWidget(
                                  validationtext: 'Enter your valid password',
                                  boolvalue: obscureTextreg2,
                                  //labeltext: 'Confirm Password',
                                  hindtext: 'Confirm Password',
                                  controllerobject:
                                      confirmpasswordcontrollerreg,
                                  formvalidator:
                                      'Re-enter Password for confirm password',
                                  icon: InkWell(
                                    onTap: toggle2,
                                    child: new Icon(obscureTextreg2
                                        ? Icons.remove_done
                                        : Icons.remove_red_eye),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.valuefirst = value!;
                                        });
                                      },
                                      value: this.valuefirst,
                                    ),
                                    Text('accept Terms & Conditions')
                                  ]),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        //color: Colors.orange,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color.fromRGBO(255, 181, 23, 1),
                            child: Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                              }
                              if (passwordcontrollerreg.text.toString() !=
                                  confirmpasswordcontrollerreg.text
                                      .toString()) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Password & Confirm password are not match",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }

                              if (valuefirst == false) {
                                Fluttertoast.showToast(
                                    msg: "Please accept the Terms & Conditions",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a Snackbar.
                                }
                                fetchAlreadyRegistered(mobilecontrollerreg.text)
                                    .then((value) => {result1 = value.result})
                                    .whenComplete(() => {
                                          if (result1 == false)
                                            {
                                              if (_formKey.currentState!
                                                  .validate())
                                                {
                                                  // If the form is valid, display a Snackbar.
                                                },
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Already registered/Invalid data",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0),
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()))
                                            }
                                          else if (result1 == true)
                                            {
                                              if (passwordcontrollerreg.text
                                                      .toString() !=
                                                  confirmpasswordcontrollerreg
                                                      .text
                                                      .toString())
                                                {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Password & Confirm password are not match",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0),
                                                }
                                              else
                                                {
                                                  fetchRegistration(
                                                          mobilecontrollerreg
                                                              .text
                                                              .toString(),
                                                          passwordcontrollerreg
                                                              .text
                                                              .toString())
                                                      .then((value) => {
                                                            userstatus =
                                                                value.status,
                                                            usermobile =
                                                                value.userMobile
                                                          })
                                                      .whenComplete(() => {
                                                            if (userstatus == 0)
                                                              {
                                                                fetchVerification(
                                                                    mobilecontrollerreg
                                                                        .text
                                                                        .toString(),
                                                                    passwordcontrollerreg
                                                                        .text
                                                                        .toString()),
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "Enter your received OTP ",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .CENTER,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        16.0),
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            OtpPage(
                                                                              mobilenumber1: mobilecontrollerreg.text.toString(),
                                                                            ))),
                                                                setState(() {
                                                                  passwordcontrollerreg
                                                                      .clear();
                                                                  confirmpasswordcontrollerreg
                                                                      .clear();
                                                                })
                                                              }
                                                            else if (userstatus ==
                                                                1)
                                                              {
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "Registration not successfully",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .CENTER,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        16.0),
                                                              }
                                                          }),
                                                }
                                            }
                                        });
                              }
                            }))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
