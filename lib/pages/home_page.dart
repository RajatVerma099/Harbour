import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harbour/pages/home_page.dart';
import 'package:harbour/pages/sample_resume_page.dart';
import 'package:harbour/pages/show_data.dart';
import 'package:harbour/tools/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../drawer/main_drawer.dart';
import 'GetJobReady.dart';
import 'TechnologiesPage.dart';
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the icon color to white
        ),
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(context),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace the existing Image.network with the rotating image
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Stack(
                        children: [
                          _buildBackgroundImage(context),
                          Positioned(
                            top: -40, // Adjust the top value to set the desired height
                            left: 0,
                            right: 0,
                            child: ClipPath(
                              clipper: CurvedBackgroundClipper(),
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(_controller.value * 0.8),
                                child: Image.asset(
                                  "assets/launch/logo_launch.jpg",
                                  height: MediaQuery.of(context).size.height * 0.6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ... Your existing FloatingActionButton code remains the same
        SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(const ShowData(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 8),
                  Text("Show Jobs"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(const Resume(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 8),
                  Text("Resume Maker"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(const TechnologiesPage(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 8),
                  Text("Technologies Used"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(GetJobReady(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 8),
                  Text("Get Job Ready"),
        ],
      ), ),

    ),
    ],
    ),
      drawer: const MainDrawer(),
    );
  }
}


  Widget _buildBackgroundImage(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 3 / 5;

    return ClipPath(
      clipper: CurvedBackgroundClipper(),
      child: Container(
        height: imageHeight + 20,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }


class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
