import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BuyUsACoffee());
}

class BuyUsACoffee extends StatelessWidget {
  const BuyUsACoffee({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: const Center(child: Text('Support Us :)')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      // color: Colors.grey[600],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Donate to Harbour Team',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Container(
                    // color: Colors.lightBlue[100],
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'By supporting us, you\'re fueling the journey of Harbour—a platform committed to providing free job links, helping individuals navigate their career seas. Your contribution ensures that we continue to empower and assist countless individuals in discovering new opportunities. Together, let\'s make a positive impact on careers and transform lives. Thank you for being a crucial part of the Harbour community!',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        // color: Colors.grey[600],
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      // color: Colors.grey[600], // Darker shade of grey for background
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Tap to reveal the QR code:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Container(
                    // color: Colors.lightBlue[100],
                    // color: Colors.grey[600],
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Help us continue providing free job links',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: isExpanded ? 250 : 0,
                  child: isExpanded
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      GestureDetector(
                        onVerticalDragDown: (_) {
                          // Handle drag down event if needed
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/bmc_qr.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Can\'t scan the QR code? Click here to donate:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
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
                            'https://www.buymeacoffee.com/rv5393982t',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
