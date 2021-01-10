import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/radial_progress_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 250.0,
            height: 250.0,
            child: RadialProgressIndicator(
              percentage: porcentaje,
              outStrokeColor: Colors.blue,
              inStrokeColor: Colors.grey,
              inStrokeWitdh: 5.0,
              outStrokeWitdh: 10.0,
              gradient: LinearGradient(colors: <Color>[
                Color(0xffc012ff),
                Color(0xff6d05ea),
                Colors.red
              ]),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _refresh,
      ),
    );
  }

  void _refresh() {
    setState(() {
      porcentaje += 10.0;
      if (porcentaje > 100.0) porcentaje = 0.0;
    });
  }
}
