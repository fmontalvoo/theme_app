import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Gradient gradient;
  final Function onPressed;

  const LargeButton({
    Key key,
    this.title = '',
    @required this.icon,
    this.gradient,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(children: [
        LargeButtonBackground(gradient, this.icon),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140.0, width: 40.0),
            FaIcon(this.icon, size: 40, color: Colors.white),
            SizedBox(width: 20.0),
            Expanded(
              child: Text(this.title,
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            SizedBox(width: 40.0),
          ],
        )
      ]),
      onTap: this.onPressed,
    );
  }
}

class LargeButtonBackground extends StatelessWidget {
  final Gradient gradient;
  final IconData icon;
  const LargeButtonBackground(
    this.gradient,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: this.gradient,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10.0),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Positioned(
                right: -20.0,
                top: -20.0,
                child: FaIcon(this.icon, size: 150.0, color: Colors.white24))
          ],
        ),
      ),
    );
  }
}
