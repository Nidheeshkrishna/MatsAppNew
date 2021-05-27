import 'package:flutter/material.dart';

class BusinessProfileTextform extends StatefulWidget {
  TextEditingController controllerobject = new TextEditingController();
  String labeltext, hindtext;
  int maxline, minline;
  BusinessProfileTextform(
      {required this.labeltext,
      required this.hindtext,
      required this.maxline,
      required this.minline,
      required this.controllerobject});
  @override
  _BusinessProfileTextformState createState() =>
      _BusinessProfileTextformState();
}

class _BusinessProfileTextformState extends State<BusinessProfileTextform> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: widget.controllerobject,
        minLines: widget.minline,
        maxLines: widget.maxline,
        decoration: InputDecoration(
          focusColor: Color.fromRGBO(255, 181, 23, 1),
          labelText: widget.labeltext,
          hintText: widget.hindtext,
          focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(255, 181, 23, 1),
              )),
          enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(
            color: Color.fromRGBO(255, 181, 23, 1),
          )),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(
            color: Color.fromRGBO(255, 181, 23, 1),
          )),
        ),
      ),
    );
  }
}
