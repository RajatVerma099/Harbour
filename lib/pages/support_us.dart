import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyUsACoffee extends StatefulWidget {
  const BuyUsACoffee({Key? key});

  @override
  _BuyUsACoffeeState createState() => _BuyUsACoffeeState();
}

class _BuyUsACoffeeState extends State<BuyUsACoffee> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy us a coffee'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Donate to Harbour Team',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            subtitle: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'By supporting us, you\'re fueling the journey of Harbour—a platform committed to providing free job links, helping individuals navigate their career seas. Your contribution ensures that we continue to empower and assist countless individuals in discovering new opportunities. Together, let\'s make a positive impact on careers and transform lives. Thank you for being a crucial part of the Harbour community!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          ExpansionTile(
            shape: const Border(),
            title: const Text(
              "Tap to get more details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            childrenPadding: const EdgeInsets.only(bottom: 10),
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/bmc_qr.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    launch('https://www.buymeacoffee.com/rv5393982t');
                  },
                  child: const Text(
                    'Donate',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
