import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * .9,
      height: 100.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))),
      child: RaisedButton(
          color: Color(0xffed6762),
          child: Text(
            "Create new list",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0),
          ),
          onPressed: () {}),
    );
  }
}