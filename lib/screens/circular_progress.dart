import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_ui_circular_progress/widgets/circular_progress_animate.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {


  double porcentage = 50.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Container(
                height: 300,
                width: 300,
                child: CircularProgressAnimate(porcentage: porcentage))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentage += 10;
              if (porcentage > 100) {
                porcentage = 0;
              }
            });
          },
          child: Icon(Icons.add),
        ),
      );
}
