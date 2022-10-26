import 'package:flutter/material.dart';

import '../map/map.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  PageController pageController = PageController(initialPage: 0);
  int indexPage = 0;

  Duration pageTurnDuration = const Duration(milliseconds: 500);
  Curve pageTurnCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[MapView()],
        ),
        bottomNavigationBar: SizedBox(
            height: 70,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: pageTurnDuration, curve: pageTurnCurve);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: pageTurnDuration, curve: pageTurnCurve);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        pageController.animateToPage(3,
                            duration: pageTurnDuration, curve: pageTurnCurve);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        pageController.animateToPage(4,
                            duration: pageTurnDuration, curve: pageTurnCurve);
                      },
                    ),
                  ],
                ))));
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      indexPage = index;
    });
  }
}
