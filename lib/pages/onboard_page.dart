import 'package:flutter/material.dart';
import 'package:harbour/tools/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_constants.dart';
import '../datatypes/onboard_model.dart';
import 'home_page.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = onBoardingScreens;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              jumpTo(const MyHomePage(title: "Welcome Seeker !!"), context);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, index) {
            double xOffset = (index - currentIndex) * MediaQuery.of(context).size.width;

            return Transform.translate(
              offset: Offset(xOffset, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3.0),
                              width: currentIndex == index ? 25 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: currentIndex == index ? kbrown : kbrown300,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print(index);
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        jumpTo(const MyHomePage(title: "Welcome Seeker !"), context);
                      }

                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}