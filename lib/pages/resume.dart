import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Resume(),
  ));
}

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
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

  late CarouselController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Viewer'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: imageUrls.length,
            options: CarouselOptions(
              height: 600.0,
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              pageSnapping: false,
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
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
                    borderRadius: BorderRadius.zero,
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: FrostedGlassHeader(),
          ),
          Positioned(
            bottom: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                    (index) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(index == _currentIndex ? 1.0 : 0.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrostedGlassHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.5)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Tap to Download',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
