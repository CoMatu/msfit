import 'package:flutter/material.dart';
import 'package:msfit_design/features/msfit/presentation/pages/user_page.dart';
import 'package:msfit_design/features/msfit/presentation/pages/water_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _pages = [
    UserPage(),
    WaterPage(),
    Icon(Icons.image),
    Icon(Icons.directions_car)
  ];

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final positionModel = Provider.of<PositionModel>(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.62,
                    decoration: BoxDecoration(
                      color: Color(0xff543cb6),
                    ),
                  ),
                  clipper: CustomClipPath(),
                ),
                ClipPath(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 12.0),
                          height: MediaQuery.of(context).size.height * 0.505,
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: _pages.length,
                              itemBuilder: (context, position) => Container(
                                    child: _pages[position],
                                  ),
                              onPageChanged: (num) {
                                positionModel.setPosition(num);
                              }),
                        ),
                        AnimationDots(
                          dotCount: _pages.length,
                        ),
                        // for page view indicator
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.615,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Color(0xff845DDA),
                          Color(0xff8f5de8),
                        ])),
                  ),
                  clipper: CustomClipPathInner(),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xffc945d7),
                      shape: BoxShape.circle,
/*
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffc945d7),
                            blurRadius: 4.0,
                            offset: Offset(1, 2.0)),
                      ],
*/
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              'res/images/dumbbells.png',
                              width: 40.0,
                            ),
                          ),
                        ),
                        Text(
                          'Workout',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Opacity(
                            opacity: 0.6,
                            child: Text(
                              '6 excercises',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xffE2466C),
                      shape: BoxShape.circle,
/*
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffE2466C),
                            blurRadius: 4.0,
                            offset: Offset(1, 2.0)),
                      ],
*/
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              'res/images/coctail.png',
                              width: 30.0,
                            ),
                          ),
                        ),
                        Text(
                          'Diet',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Opacity(
                            opacity: 0.6,
                            child: Text(
                              '3 meals',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 56.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      child: Image.asset('res/icons/home_icon_active.png')),
                  Container(
                    height: 7.0,
                  ),
                  Container(
                      height: 5.0,
                      child: Image.asset('res/icons/active_dot.png')),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 19.0,
                      child: Image.asset('res/icons/kettleball_icon.png')),
                  Container(
                    height: 7.0,
                  ),
//                  Container(height: 5.0 ,child: Image.asset('res/icons/active_dot.png')),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      child: Image.asset('res/icons/chart_icon.png')),
                  Container(
                    height: 7.0,
                  ),
//                  Container(height: 5.0 ,child: Image.asset('res/icons/active_dot.png')),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      child: Image.asset('res/icons/doc_icon.png')),
                  Container(
                    height: 7.0,
                  ),
//                  Container(height: 5.0 ,child: Image.asset('res/icons/active_dot.png')),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      child: Image.asset('res/icons/person_icon.png')),
                  Container(
                    height: 7.0,
                  ),
//                  Container(height: 5.0 ,child: Image.asset('res/icons/active_dot.png')),
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 20.0,
              )
            ]),
      ),
    );
  }
}

class AnimationDots extends StatelessWidget {
  final int dotCount;

  const AnimationDots({Key key, @required this.dotCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dotList = List<Widget>.generate(dotCount, (count) {
      return _buildDot(count, context);
    });

    return Consumer<PositionModel>(
      builder: (context, position, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: dotList,
        );
      },
    );
  }

  static Widget _buildDot(int index, context) {
    final _positionModel = Provider.of<PositionModel>(context);
    final _height = 6.0;
    _positionModel.setIndex(index);
    return Opacity(
      opacity: _positionModel.getOpacity(),
      child: AnimatedContainer(
        child: Container(
          margin: EdgeInsets.only(left: 8.0, right: 8.0),
          height: _height,
          width: _positionModel.getWidth(),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_height / 2)),
        ),
        duration: Duration(seconds: 2),
        curve: Curves.bounceIn,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPathInner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 120);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 120);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PositionModel with ChangeNotifier {
  int _position = 0;
  int _index;
  double _width = 6.0;

  getPosition() => _position;

  setPosition(int position) {
    _position = position;

    notifyListeners();
  }

  getIndex() => _index;

  setIndex(int value) {
    _index = value;
  }

  getWidth() {
    if (_position == _index) return _width * 4;
    return _width;
  }

  getOpacity() {
    double _opacity = 0.6;
    if (_position == _index) return _opacity = 1;
    return _opacity;
  }
}
