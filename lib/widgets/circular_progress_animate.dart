import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressAnimate extends StatefulWidget {
  final double porcentage;

  const CircularProgressAnimate({@required this.porcentage});

  @override
  _CircularProgressAnimateState createState() =>
      _CircularProgressAnimateState();
}

class _CircularProgressAnimateState extends State<CircularProgressAnimate>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPorcentage;

  //The animations is almost the same form that the previous section (Shapes).
  @override
  void initState() {
    previousPorcentage = widget.porcentage;
    controller = new AnimationController(
      vsync: this, //SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 450),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: .0);
    
    final difference = widget.porcentage - previousPorcentage;
    previousPorcentage = widget.porcentage;

    //With the controller and this widget we can animate this widget
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _CustomPaint((widget.porcentage - difference) +
                  (difference * controller.value)),
            ),
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//To draw shape use always a CustomPainter
class _CustomPaint extends CustomPainter {
  final porcentage;

  _CustomPaint(this.porcentage);

  @override
  void paint(Canvas canvas, Size size) {
    //To draw something we neeed
    final paint = new Paint()
      //Cascade notation
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    //Shape position
    final center = Offset(size.width / 2, size.height / 2);
    //Coordenates in center

    //Return the lesser number of two numbers
    final radius = min(size.width / 2, size.height / 2);
    //Explation: When the shape dimensions  changes the circle maintains the radius to dont get out of the shape

    canvas.drawCircle(center, radius, paint);

    //Bow
    final paintBow = new Paint()
      //Cascade notation
      ..strokeWidth = 5
      ..color = Colors.pink
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //Porcentage to Fill
    double bowAngle = 2 * pi * (porcentage / 100);
    // 2 * pi means a complete circle. When this one is split  by 100 means the porcentage to fill of the bow

    canvas.drawArc(
        //The same values of the circle. Make match
        Rect.fromCircle(
          radius: radius,
          center: center,
        ),
        //The bow begin to start to draw
        -pi / 2,
        bowAngle,
        false,
        paintBow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
