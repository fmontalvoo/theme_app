import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final Color color;

  ListItem({Key key, this.title = '', this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 100.0,
      margin: EdgeInsets.all(7.0),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(30.0)),
      child: Text(this.title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21.0)),
    );
  }
}
// https://stackoverflow.com/questions/50614661/how-to-underline-text-in-flutter