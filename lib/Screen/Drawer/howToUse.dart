import 'package:flutter/material.dart';
import 'package:myapp/Screen/homePage.dart';
import 'package:myapp/Widget/howToUsePage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class howToUse extends StatefulWidget {
  const howToUse({super.key});

  @override
  State<howToUse> createState() => _howToUseState();
}

class _howToUseState extends State<howToUse> {
  PageController _controller = PageController();

  bool onLastPage = false;

  bool onFirstPage = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 3);
                });
                setState(() {
                  onFirstPage = (index == 0);
                });
              },
              children: [
                howToUsePage(
                  color: Colors.white,
                  urlImg: 'assets/EVIE.png',
                  title: 'Welcome to EvBuddy',
                  subtitle: "Let's get to know what you can do with EVBuddy",
                  context: context,
                  name: Login(),
                ),
                howToUsePage(
                  color: Colors.white,
                  urlImg: 'assets/EVIE.png',
                  title: 'Nearby charging station',
                  subtitle: "Explore charging spot and parking slots around you",
                  context: context,
                  name: Login(),
                ),
                howToUsePage(
                  color: Colors.white,
                  urlImg: 'assets/EVIE.png',
                  title: 'Choose your own spots',
                  subtitle: "Up to you. Charging or Parking?",
                  context: context,
                  name: Login(),
                ),
                howToUsePage(
                  color: Colors.white,
                  urlImg: 'assets/EVIE.png',
                  title: 'Become a Member',
                  subtitle:
                      "Receive special privileges and great deals from us",
                  context: context,
                  name:Login(),
                ),
              ],
            ),
            Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //  back
                  onFirstPage
                      ? Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(32, 33, 35, 1),
                              radius: 25,
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: SlideEffect(
                        dotHeight: 15,
                        dotWidth: 15,
                        spacing: 13,
                        dotColor: Color.fromRGBO(217, 217, 217, 1),
                        activeDotColor: Color.fromRGBO(26, 116, 226, 1)),
                  ),

                  // next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            print("Pop to map");
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: ((context) => Login())));
                          },
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(26, 116, 226, 1),
                              radius: 25,
                              child: Icon(
                                Icons.done,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(26, 116, 226, 1),
                              radius: 25,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
