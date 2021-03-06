import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/radial_progress_indicator.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
            width: 250.0,
            height: 250.0,
            child: RadialProgressIndicator(
              percentage: porcentaje,
              // outStrokeColor: Colors.amber,
              inStrokeColor: theme.textTheme.bodyText1.color,
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
