import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _visible ? 1.0 : 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            'Water tracking',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '1000 ml',
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
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('res/images/water_drop.png'),
                        fit: BoxFit.scaleDown),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 180.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
/*
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            width: 4.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
*/
                    Container(
                      child: CustomPaint(
                        painter: GlassProgress(),
                        child: Container(
                          height: 150.0,
                          width: 100.0,
                        ),
                      ),
                    ),
/*
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            width: 4.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 6.0;
    paint.strokeCap = StrokeCap.round;

    var path = Path();

//    path.lineTo(size.width, 0);
//    path.moveTo(size.width*0.9, 0);
//    path.conicTo(size.width / 5, size.height, size.width, size.height, 20);
    path.moveTo(size.width, 0);
    path.conicTo(size.width / 5, size.width, size.height, size.width, 20);
//    path.lineTo(size.width * 0.85, size.height);
//    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
