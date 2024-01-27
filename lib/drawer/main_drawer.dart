import 'package:flutter/material.dart';
import '../pages/UserPage.dart';
import '../pages/UserPage_two.dart';

class MainDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl1 =
        'https://lh3.googleusercontent.com/a/ACg8ocIVcgin3A99fK8VigTnG8GCnRSZDduL6ZLobV_wZtCTY4Q=s96-c';
    const imageUrl2 =
        'https://lh3.googleusercontent.com/a/ACg8ocLN7LNv35v37V7BQKYKTCyvfCgKoi1n5iRi65sH80DHotc=s96-c';

    return Drawer(
      child: Material(
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            buildHeader(
              imageUrl: imageUrl1,
              name: 'Mudit Garg',
              email: 'muditgarg48@gmail.com',
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserPage_two(
                    name: 'Mudit Garg',
                  ),
                ),
              ),
            ),
            buildHeader(
              imageUrl: imageUrl2,
              name: 'Rajat Verma',
              email: 'lostpoet099@gmail.com',
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserPage(
                    name: 'Rajat Verma',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '🚀 Thanks for Choosing Harbour! 🚀\n\nHey Harbour Explorers,\n\n\n  Big thanks for setting sail with us! Your journey matters. 😊 Loved it? Share the vibes! Spread the word about Harbour and let\'s help more folks navigate their career seas together.\n\n Cheers,\nThe Harbour Crew',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
    required String imageUrl,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.grey[900], // Dark Background Color
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
            child: Row(
              children: [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );
}
