import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:webapp/Pages/Completebussinessdetails.dart';

import 'package:webapp/Services/otpRest.dart';

class OtpPage extends StatefulWidget {
  bool otpvalue1;
  final String mobilenumber1;
  @required
  OtpPage({
    Key? key,
    this.otpvalue1 = true,
    required this.mobilenumber1,
  }) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late dynamic fieldotp = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                'OTP',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
              Container(
                margin: EdgeInsets.all(30),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2, //                   <--- border width here
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                          30.0) //                 <--- border radius here
                      ),
                ),
                child: OTPTextField(
                  keyboardType: TextInputType.number,
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 20),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    fieldotp = pin;
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 60, right: 60, top: 15, bottom: 15),
                      child: Text('Continue')),
                  color: Color.fromRGBO(255, 181, 23, 1),
                  onPressed: () {
                    fetchOtp(fieldotp.toString(), widget.mobilenumber1)
                        .then((value) => {
                              widget.otpvalue1 = value.status,
                              if (widget.otpvalue1 == true)
                                {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Complete your Bussiness Registration ",
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
                                              CompleteBussinessDetails(
                                                mobile1: widget.mobilenumber1,
                                              ))),
                                }
                              else if (widget.otpvalue1 == false)
                                {
                                  Fluttertoast.showToast(
                                      msg: "Registration not completed",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                }
                            });
                  })
            ],
          ),
        )),
      ),
    );
  }
}
