import 'package:flutter/material.dart';
class UserPage extends StatelessWidget {
  final String name;
  const UserPage({
    Key? key,
    required this.name,
    String assetImage = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black12,
      title: const Text('About App Developer'),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/rvrox.jpeg'),
              ),
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
                ' life is a virtual mess we weave ',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 35,
                height: 30,
              ),
              const Card(
                //padding: EdgeInsets.all(10.0),
                  color: Colors.white54,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      '   lostpoet099@gmail.com',
                    ),
                  )),
              const Card(
                  color: Colors.white54,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        '   +1800 180 000 xyz 0',
                      ))),
              const SizedBox(
                width: 30,
                height: 50,
              ),
              const Text(
                '          I HOPE THIS APP WILL \n HELP YOU WITH YOUR STUDIES.  ',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20.0,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 50,
              ),
              Image.asset(
                'assets/down.gif',
                width: 150,
                height: 110,
              ),
              const SizedBox(
                width: 30,
                height: 50,
              ),
              const Card(
                  color: Colors.white54,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.add_reaction,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        ' Kind Hooomans Who Helped Me',
                      ))),
              const SizedBox(
                width: 30,
                height: 80,
              ),
              const Text(
                ' Pulkit Shukla ',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                '( resource accumulator)',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 40,
              ),
              const Text(
                ' Zoya Afreen and Rahul Gupta',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'and V.S.I.C.S. 6th sem\'s teachers',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '( for the content that is present in this app.)',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                width: 30,
                height: 40,
              ),
              const Text(
                'Dayalu Bhai',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 00,
              ),
              const Text(
                '(constant motivator)',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ig: the_aalu',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 40,
              ),
              const Text(
                'Mudit Garg',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 00,
              ),
              const Text(
                '( naam hi kafi hai )',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 40,
              ),
              const Text(
                'Anshu Sir',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 00,
              ),
              const Text(
                '( for rectifications)',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Image.asset(
                'assets/down.gif',
                width: 150,
                height: 110,
              ),
              const Card(
                  color: Colors.white54,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.add_reaction,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        ' My Insta Handle',
                      ))),
              const SizedBox(
                width: 30,
                height: 100,
              ),
              const Text(
                'ig : @lost_poet_099_',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 300,
              ),
              const Text(
                'that\'s it \n byyeee!!',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 25.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
                height: 60,
              ),
              const SizedBox(
                width: 30,
                height: 700,
              ),
              const Text(
                'stop scrolling  !!!',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                  //  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                width: 30,
                height: 40,
              ),

            ]),
      ),
    ),
  );
}
