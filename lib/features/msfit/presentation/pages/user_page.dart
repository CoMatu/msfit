import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 30.0).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Today, April 19',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'hello, Sarah',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: ExactAssetImage('res/images/user_face_blue.jpg'),
                      fit: BoxFit.scaleDown),
                  borderRadius: BorderRadius.circular(60.0),
                  border: Border.all(width: 4.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
        Center(
          child: CustomPaint(
            foregroundPainter: CircleProgress(animation.value),
            child: Container(
              height: 200.0,
              width: 200.0,
              child: Column(
                children: <Widget>[
                  Text(
                    '14',
                    style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Today, April 19',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 7
      ..color = Colors.black12
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 7
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
