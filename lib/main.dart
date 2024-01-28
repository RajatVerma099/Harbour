import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'pages/onboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  OneSignal.initialize("56c94a7a-618b-41d6-8db3-955968baf359");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harbour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // Adjust other theme properties as needed
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/img/infinity.gif', fit: BoxFit.cover),
        splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        duration: 2000,
        nextScreen: MyAppScreen(),
      ),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  @override
  _MyAppScreenState createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  int? isViewed;

  @override
  void initState() {
    super.initState();
    checkOnBoardStatus();
  }

  Future<void> checkOnBoardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isViewed = prefs.getInt('onBoard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harbour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isViewed != 0 ? OnBoard() : const MyHomePage(title: "Welcome Seeker !!"),
    );
  }
}