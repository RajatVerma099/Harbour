import 'package:flutter/material.dart';
import 'package:harbour/show_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'onboard_model.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'img/onboard1.jpg',
      text: "Welcome to Harbour",
      desc:
      "Welcome to Harbour, your harbor for navigating the job market! We're here to guide you on your quest for meaningful employment. Let's set sail on a journey together to discover personalized resources for your career aspirations.",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'img/onboard2.jpg',
      text: "Navigate Resources",
      desc:
      "Navigate through a treasure trove of resources designed to elevate your job application journey. From crafting an impactful resume to mastering the art of interviews, Harbour equips you with the essentials to excel in your job search. Let's embark on this voyage and chart your course to success!",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'img/onboard3.jpg',
      text: "Connect and Thrive",
      desc:
      "Connect with a community of fellow job seekers and industry experts. Harbour is not just an app; it's a supportive community that believes in your potential. Join hands with us as we navigate the seas of opportunities together. Your next career adventure awaits — let's make it happen with Harbour!",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];

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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ShowData()));
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
          physics: NeverScrollableScrollPhysics(),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ShowData()),
                        );
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
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


// import 'package:flutter/material.dart';
// import 'package:harbour/show_data.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../constant.dart';
// import 'onboard_model.dart';
//
// class OnBoard extends StatefulWidget {
//   @override
//   _OnBoardState createState() => _OnBoardState();
// }
//
// class _OnBoardState extends State<OnBoard> {
//   int currentIndex = 0;
//   late PageController _pageController;
//   List<OnboardModel> screens = <OnboardModel>[
//     OnboardModel(
//       img: 'img/onboard1.jpg',
//       text: "Welcome to Harbour",
//       desc:
//       "Welcome to Harbour, your harbor for navigating the job market! We're here to guide you on your quest for meaningful employment. Let's set sail on a journey together to discover personalized resources for your career aspirations.",
//       bg: Colors.white,
//       button: Color(0xFF4756DF),
//     ),
//     OnboardModel(
//       img: 'img/onboard2.jpg',
//       text: "Navigate Resources",
//       desc:
//       "Navigate through a treasure trove of resources designed to elevate your job application journey. From crafting an impactful resume to mastering the art of interviews, Harbour equips you with the essentials to excel in your job search. Let's embark on this voyage and chart your course to success!",
//       bg: Color(0xFF4756DF),
//       button: Colors.white,
//     ),
//     OnboardModel(
//       img: 'img/onboard3.jpg',
//       text: "Connect and Thrive",
//       desc:
//       "Connect with a community of fellow job seekers and industry experts. Harbour is not just an app; it's a supportive community that believes in your potential. Join hands with us as we navigate the seas of opportunities together. Your next career adventure awaits — let's make it happen with Harbour!",
//       bg: Colors.white,
//       button: Color(0xFF4756DF),
//     ),
//   ];
//
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   _storeOnboardInfo() async {
//     print("Shared pref called");
//     int isViewed = 0;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('onBoard', isViewed);
//     print(prefs.getInt('onBoard'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: currentIndex % 2 == 0 ? kwhite : kwhite,
//       appBar: AppBar(
//         backgroundColor: currentIndex % 2 == 0 ? kwhite : kwhite, //sab white rakhoonga onboarding me
//         elevation: 0.0,
//         actions: [
//           TextButton(
//             onPressed: () {
//               _storeOnboardInfo();
//               Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => ShowData()));
//             },
//             child: Text(
//               "Skip",
//               style: TextStyle(
//                 color: currentIndex % 2 == 0 ? kblack : kwhite,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: PageView.builder(
//             itemCount: screens.length,
//             controller: _pageController,
//             physics: NeverScrollableScrollPhysics(),
//             onPageChanged: (int index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             itemBuilder: (_, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(screens[index].img),
//                   Container(
//                     height: 10.0,
//                     child: ListView.builder(
//                       itemCount: screens.length,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 3.0),
//                                 width: currentIndex == index ? 25 : 8,
//                                 height: 8,
//                                 decoration: BoxDecoration(
//                                   color: currentIndex == index
//                                       ? kbrown
//                                       : kbrown300,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                             ]);
//                       },
//                     ),
//                   ),
//                   Text(
//                     screens[index].text,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 27.0,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                       color: index % 2 == 0 ? kblack : kwhite,
//                     ),
//                   ),
//                   Text(
//                     screens[index].desc,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       fontFamily: 'Montserrat',
//                       color: index % 2 == 0 ? kblack : kwhite,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       print(index);
//                       if (index == screens.length - 1) {
//                         await _storeOnboardInfo();
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) => ShowData()));
//                       }
//
//                       _pageController.nextPage(
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.bounceIn,
//                       );
//                     },
//                     child: Container(
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//                       decoration: BoxDecoration(
//                           color: index % 2 == 0 ? kblue : kwhite,
//                           borderRadius: BorderRadius.circular(15.0)),
//                       child: Row(mainAxisSize: MainAxisSize.min, children: [
//                         Text(
//                           "Next",
//                           style: TextStyle(
//                               fontSize: 16.0,
//                               color: index % 2 == 0 ? kwhite : kblue),
//                         ),
//                         SizedBox(
//                           width: 15.0,
//                         ),
//                         Icon(
//                           Icons.arrow_forward_sharp,
//                           color: index % 2 == 0 ? kwhite : kblue,
//                         )
//                       ]),
//                     ),
//                   )
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }
