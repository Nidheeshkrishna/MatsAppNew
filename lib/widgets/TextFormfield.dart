import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class TextFormWidget extends StatefulWidget {
  String labeltext, hindtext, formvalidator, validationtext, passwordvalid;
  Widget icon;
  TextEditingController controllerobject = new TextEditingController();
  late TextInputType keyboard;
  late String mobilelengthvalidator;
  late String passwordlengthvalidator;
  late String patternmatch;
  bool boolvalue;

  TextFormWidget(
      {this.labeltext = '',
      this.hindtext = '',
      required this.icon,
      required this.controllerobject,
      this.formvalidator = '',
      this.mobilelengthvalidator = '',
      this.patternmatch = '',
      this.boolvalue = false,
      this.passwordlengthvalidator = '',
      required this.validationtext,
      this.passwordvalid = ''});

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  TextEditingController mobilecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.boolvalue,
        controller: widget.controllerobject,
        validator: Validators.compose([
          Validators.required(widget.validationtext),
          Validators.patternString(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
              widget.passwordvalid)
        ]),
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Color.fromRGBO(255, 181, 23, 1),
            labelText: widget.labeltext,
            hintText: widget.hindtext,
            suffixIcon: widget.icon,
            focusedBorder: new OutlineInputBorder(
                //borderRadius: new BorderRadius.circular(1.0),
                borderRadius: BorderRadius.all(Radius.elliptical(2.0, 2)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(255, 181, 23, 1),
                )),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(1.0, 1)),
                //borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Color.fromRGBO(255, 181, 23, 1),
                )),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(2.0, 2)),
                //borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Color.fromRGBO(255, 181, 23, 1),
                )),
            disabledBorder: new OutlineInputBorder(
                //borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(
              color: Color.fromRGBO(255, 181, 23, 1),
            ))));
  }
}
