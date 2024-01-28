import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Resume(),
  ));
}

class Resume extends StatelessWidget {
  final List<String> imageUrls = [
    'https://drive.google.com/uc?export=view&id=1sTfin3hQVKT2WKFpSHaCznt-W-f8XGnA',
    'https://drive.google.com/uc?export=view&id=1sU1sa4NThCu4Z6FiGKb5K7p09TYS12TW',
    'https://drive.google.com/uc?export=view&id=1sWC99OshB4y9wpPKAzEu9UzMumjD4lnh',
    'https://drive.google.com/uc?export=view&id=1sXBpJ1LdkgWVDSC6gS4IiJXxkgbOtLNF',
    'https://drive.google.com/uc?export=view&id=1sYW0lpg2VTZhPEOhewPaQ2XalbLiy4lo',
    'https://drive.google.com/uc?export=view&id=1shuH_nAqYWK3BEJVC-SlYuP1IQYE4t4U',
    'https://drive.google.com/uc?export=view&id=1siM83IfgqvEyLCORwMHQ0-umyJaVfy29',
    'https://drive.google.com/uc?export=view&id=1siOWo9qv4Z8uFw0el9ZIrXgFSzu_s-ms',
    'https://drive.google.com/uc?export=view&id=1sjUGrZIgLbiOoyVruoIjFSb2JEa6OrXj',
    'https://drive.google.com/uc?export=view&id=1slROfIV1XJU5iRrSumYVao2iwiS9c2pn',
  ];

  Resume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Viewer'),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imageUrls.length,
          options: CarouselOptions(
            height: 600.0,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              child: Card(
                elevation: 16.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
