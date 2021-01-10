import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:themes_app/src/pages/headers_page.dart';
import 'package:themes_app/src/pages/emergency_page.dart';
import 'package:themes_app/src/pages/pinterest_page.dart';
import 'package:themes_app/src/pages/slide_show_page.dart';
import 'package:themes_app/src/pages/cuadrado_animado_page.dart';
import 'package:themes_app/src/pages/circular_progress_page.dart';
import 'package:themes_app/src/pages/sliver_list_page.dart';

class AppRoutes {
  static final List<_Route> appRoutes = [
    _Route(
        icon: FontAwesomeIcons.slideshare,
        title: "Slideshow",
        page: SlideShowPage()),
    _Route(
        icon: FontAwesomeIcons.ambulance,
        title: "Emergencia",
        page: EmergencyPage()),
    _Route(
        icon: FontAwesomeIcons.heading,
        title: "Encabezados",
        page: HeadersPage()),
    _Route(
        icon: FontAwesomeIcons.peopleCarry,
        title: "Cuadro animado",
        page: CuadradoAnimadoPage()),
    _Route(
        icon: FontAwesomeIcons.circleNotch,
        title: "Indicador circular",
        page: CircularProgressPage()),
    _Route(
        icon: FontAwesomeIcons.pinterest,
        title: "Pinteres",
        page: PinterestPage()),
    _Route(
        icon: FontAwesomeIcons.mobile,
        title: "Slivers",
        page: SliverListPage()),
  ];
}

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({this.icon, this.title, this.page});
}
