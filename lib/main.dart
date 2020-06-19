import 'package:flutter/material.dart';
import 'package:test_ui_circular_progress/screens/circular_progress.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular progress Indicator',
      home: CircularProgressPage(),
    );
  }
}
