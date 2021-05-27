import 'package:flutter/material.dart';

class DropdownformField extends StatefulWidget {
  String hindtext, labeltext;
  dynamic items;
  DropdownformField(
      {required this.hindtext, required this.labeltext, this.items});
  @override
  _DropdownformFieldState createState() => _DropdownformFieldState();
}

class _DropdownformFieldState extends State<DropdownformField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButtonFormField(
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
      hint: Text(widget.hindtext),
      items: widget.items,
    ));
  }
}
