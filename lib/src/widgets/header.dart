import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final List<Color> backgroundColors;

  const Header(
      {Key key,
      @required this.icon,
      this.title = '',
      this.subtitle = '',
      this.backgroundColors = const [Color(0xff526bf6), Color(0xff67acf2)]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _HeaderBackground(this.backgroundColors),
      Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon(
            this.icon,
            size: 250.0,
            color: Colors.white.withOpacity(0.25),
          )),
      Center(
        child: Column(
          children: [
            SizedBox(height: 70.0),
            Text(
              this.subtitle,
              style: TextStyle(fontSize: 20.0, color: Colors.white70),
            ),
            SizedBox(height: 20.0),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
            SizedBox(height: 20.0),
            FaIcon(
              this.icon,
              size: 70.0,
              color: Colors.white,
            ),
          ],
        ),
      )
    ]);
  }
}

class _HeaderBackground extends StatelessWidget {
  final List<Color> backgroundColors;

  _HeaderBackground(this.backgroundColors);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: this.backgroundColors)),
    );
  }
}