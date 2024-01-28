import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuyUsACoffee());
}

class BuyUsACoffee extends StatelessWidget {
  const BuyUsACoffee({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DonationPage(),
    );
  }
}

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key});

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Support Harbour')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: const Text('Donate to Harbour Team'),
                subtitle: const Text('Help us continue providing free job links'),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500), // Adjusted duration
                height: isExpanded ? 200 : 0,
                child: isExpanded
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Scan the QR code below to donate:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 150,
                      width: 150, // Set the width to make it appear at the center both height and width-wise
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/bmc_qr.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Can\'t scan the QR code? Click here to donate:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          // Handle link tap
                          if (kDebugMode) {
                            print('Opening donation link');
                          }
                        },
                        child: const Text(
                          'https://www.buymeacoffee.com/rv5393982t',
                          style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
