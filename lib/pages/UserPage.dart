import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserPage extends StatelessWidget {
  final String name;
  const UserPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black12,
      title: const Text('About App Developer'),
      centerTitle: true,
    ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/img/rv.jpg'),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Rajat Verma',
              style: TextStyle(
                fontFamily: 'DanceScript',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
              width: 150.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            const Text(
              'Life is a virtual mess we weave',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 15.0,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildClickableIcon(
                    context: context,
                    icon: 'assets/img/gmail.png',
                    onTap: () {
                      launch('mailto:lostpoet099@gmail.com');
                    },
                  ),
                  buildClickableIcon(
                    context: context,
                    icon: 'assets/img/linkedin.png',
                    onTap: () {
                      launch('https://www.linkedin.com/in/rajat-verma-321336224/');
                    },
                  ),
                  buildClickableIcon(
                    context: context,
                    icon: 'assets/img/github_.png',
                    onTap: () {
                      launch('https://github.com/RajatVerma099');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
            const SizedBox(height: 300),
            const Text(
              'That\'s it. Bye!',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 25.0,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 60),
            const SizedBox(height: 700),
            const Text(
              'Stop scrolling!!!',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 15.0,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
  );

  Widget buildClickableIcon({
    required BuildContext context,
    required String icon,
    VoidCallback? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25, // Adjust the width as needed
          child: Column(
            children: [
              Image.asset(
                icon,
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 10),
              const Text(
                '',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      );
}
