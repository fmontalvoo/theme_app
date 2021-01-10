import 'dart:ui';
import 'dart:math' as Math;

import 'package:flutter/material.dart';

class CircularProgrePage extends StatefulWidget {
  @override
  _CircularProgrePageState createState() => _CircularProgrePageState();
}

class _CircularProgrePageState extends State<CircularProgrePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double percentage = 0.0;
  double aux = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, aux, _controller.value);
        print(percentage);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: EdgeInsets.all(7.0),
        width: 250.0,
        height: 250.0,
        color: Colors.white70,
        child: CustomPaint(painter: _RadialProgress(percentage: percentage)),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _refresh,
      ),
    );
  }

  void _refresh() {
    setState(() {
      percentage = aux;
      aux += 10.0;
      if (aux > 100.0) {
        aux = 0.0;
        percentage = 0.0;
      }
      _controller.forward(from: 0.0);
    });
  }
}

class _RadialProgress extends CustomPainter {
  final double percentage;

  _RadialProgress({this.percentage = 0.0});
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo
    final paintCricle = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCricle);

    // Arco
    final paintArc = Paint()
      ..strokeWidth = 10.0
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (percentage / 100.0);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        (-Math.pi / 2.0), arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
