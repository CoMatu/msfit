import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80.0,
        ),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
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
      ],
    );
  }
}
