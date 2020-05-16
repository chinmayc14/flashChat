import 'package:flutter/material.dart';
import 'package:flashchat/helper/color.dart';
import 'screens/welcome_scren.dart';

class InfoScreen extends StatefulWidget {
  static const String id = 'Info';

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: ColorSys.secLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                makepage(
                    title: 'Flash Chat',
                    content:
                        'This is Flash Chat.\nChat with your friends and family',
                    image: 'images/page1.jpg'),
                makepage(
                    title: 'Security',
                    content: 'Secure chats with\nFirebase Security',
                    image: 'images/page2.jpg'),
                makepage(
                    title: 'Join Now',
                    content: 'Register now,Share with your friends',
                    image: 'images/page3.jpg'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 700, left: 190),
              child: Row(
                children: _buildIndicator(),
              ),
            ),
          ],
        ));
  }

  Widget makepage({title, content, image}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 120),
            child: Image.asset(image),
          ),
          Text(
            title,
            style: TextStyle(
              color: ColorSys.primary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorSys.gray,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 7,
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        color: ColorSys.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i)
        indicators.add(_indicator(true));
      else
        indicators.add(_indicator(false));
    }
    return indicators;
  }
}
