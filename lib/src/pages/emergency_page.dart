import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:themes_app/src/widgets/header.dart';
import 'package:themes_app/src/widgets/large_button.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.amber,
        body: Stack(
      children: [
        _buildItems(),
        _buildHeader(),
      ],
    ));
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Header(
          icon: FontAwesomeIcons.plus,
          title: "Asistencia médica",
          subtitle: "Haz solicitado",
        ),
        Positioned(
          right: 0.0,
          top: 40.0,
          child: RawMaterialButton(
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _buildItems() {
    return Container(
      margin: EdgeInsets.only(top: 250.0),
      child: ListView(physics: BouncingScrollPhysics(), children: [
        FadeInLeft(
          child: LargeButton(
              title: "Motor Acident",
              icon: FontAwesomeIcons.carCrash,
              gradient: LinearGradient(
                colors: [Color(0xff6989f5), Color(0xff906ef5)],
              ),
              onPressed: () {}),
        ),
        FadeInLeft(
          child: LargeButton(
              title: "Medical Emergency",
              icon: FontAwesomeIcons.plus,
              gradient: LinearGradient(
                colors: [Color(0xff66A9F2), Color(0xff536CF6)],
              ),
              onPressed: () {}),
        ),
        FadeInLeft(
          child: LargeButton(
              title: "Theft / Harrasement",
              icon: FontAwesomeIcons.theaterMasks,
              gradient: LinearGradient(
                colors: [Color(0xffF2D572), Color(0xffE06AA3)],
              ),
              onPressed: () {}),
        ),
        FadeInLeft(
          child: LargeButton(
              title: "Awards",
              icon: FontAwesomeIcons.biking,
              gradient: LinearGradient(
                colors: [Color(0xff46997D), Color(0xff317183)],
              ),
              onPressed: () {}),
        ),
      ]),
    );
  }
}
