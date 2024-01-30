import 'package:flutter/material.dart';
import 'package:harbour/tools/navigation.dart';
import '../pages/dev_page.dart';
import '../pages/support_us.dart';

class MainDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const MainDrawer({Key? key}) : super(key: key);

  Widget intro() {
    return const Text(
      '🚀 Thanks for Choosing Harbour! 🚀\n\nHey Harbour Explorers,\n\n\n  Big thanks for setting sail with us! Your journey matters. 😊 Loved it? Share the vibes! Spread the word about Harbour and let\'s help more folks navigate their career seas together.\n\n Cheers,\nThe Harbour Crew',
      style: TextStyle(
        fontSize: 17.0,
        color: Colors.black,
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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.grey[900],
        // Dark Background Color
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 30, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );

  List<Widget> meetTheDevs(BuildContext context) {
    const imageUrl1 =
        'https://lh3.googleusercontent.com/a/ACg8ocIVcgin3A99fK8VigTnG8GCnRSZDduL6ZLobV_wZtCTY4Q=s96-c';
    const imageUrl2 =
        'https://lh3.googleusercontent.com/a/ACg8ocLN7LNv35v37V7BQKYKTCyvfCgKoi1n5iRi65sH80DHotc=s96-c';
    return [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "MEET THE DEVS",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      buildHeader(
        imageUrl: imageUrl1,
        name: 'Mudit Garg',
        email: 'muditgarg48@gmail.com',
        onClicked: () =>
          goTo(
            const DevPage(
              firstName: 'Mudit',
              lastName: 'Garg',
              avatarLink: 'assets/img/mg.jpg',
              lifeMotto: 'It is what it is !',
              connectionLinks: {
                'email': 'gargmu@tcd.ie',
                'linkedin': 'https://www.linkedin.com/in/muditgarg48/',
                'github': 'https://github.com/muditgarg48',
              },
              sendOffQuote: 'Adios amigo!',
            ), 
            context,
          ),
      ),
      buildHeader(
        imageUrl: imageUrl2,
        name: 'Rajat Verma',
        email: 'lostpoet099@gmail.com',
        onClicked: () =>
          goTo(
            const DevPage(
              firstName: 'Rajat',
              lastName: 'Verma',
              avatarLink: 'assets/img/rv.jpg',
              lifeMotto: 'Life is a virtual mess we weave',
              connectionLinks: {
                'email': 'lostpoet099@gmail.com',
                'linkedin': 'https://www.linkedin.com/in/rajat-verma-321336224/',
                'github': 'https://github.com/RajatVerma099',
              },
              sendOffQuote: 'That\'s it. Bye!',
            ), 
            context,
          ),
      ),
    ];
  }

  Widget buildSupportButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10), // Adjusted margin
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BuyUsACoffee()));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors
              .grey[900], // Same background color as the cards for Rajat and Mudit
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10), // Adjusted padding
          child: Center(
            child: Text(
              'Support Us',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return NavigationDrawer(
      // backgroundColor: ThemeData().primaryColor,
        backgroundColor: Colors.white,
        children: [
        intro(),
        const Divider(
          indent: 30,
          endIndent: 30,
        ),
        ...meetTheDevs(context),
        const Divider(
          indent: 30,
          endIndent: 30,
        ),
        buildSupportButton(context),
      ]
    );
  }
}