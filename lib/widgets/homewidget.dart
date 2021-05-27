import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  late String cardhead1, image;
  HomeWidget({required this.cardhead1, required this.image});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 5),
      child: Column(
        children: [
          Container(
            height: 190,
            width: 190,
            child: Card(
              child: Image.asset(widget.image),
            ),
          ),
          Text(
            widget.cardhead1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }
}
