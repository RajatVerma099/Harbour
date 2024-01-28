import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final List<String> pdfFileUrls = [
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/1-Black%20White%20Minimalist%20CV%20Resume.pdf?alt=media&token=0cee7f98-2d34-4e96-885f-4ab6b4d4e65e',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/2-Blue%20And%20Pink%20Modern%20Graphic%20Designer%20Resume%20(1).pdf?alt=media&token=f909ef82-e0f1-4550-b897-0ac006c97d12',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/3-Blue%20Lines%20Marketing%20Manager%20Professional%20Simple%20CV%20Resume.pdf?alt=media&token=39659117-297e-4a82-947f-8b6f66656b44',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/4-dark%20blue%20and%20black%20cv%20resume.pdf?alt=media&token=bc64cc3e-7f8b-49c5-8f93-6b7c2fe36425',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/5-%20Entry%20Level%20Fresher%20Resume%20in%20Black%20and%20White%20Simple%20Style.pdf?alt=media&token=5e927d54-4831-4266-bfcb-5c7289e8c683',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/6-Gold%20Minimalist%20Professional%20Work%20Data%20Analyst%20Friendly%20Resume.pdf?alt=media&token=e5761103-9852-46df-939f-a9cd02e5a1f2',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/7-Gray%20Green%20Neutral%20Minimalist%20Corporate%20Professional%20Web%20Developer%20Resume.pdf?alt=media&token=adf3f7cc-5b68-45ea-b13c-26157133246d',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/8-Light%20Grey%20Minimalist%20resume.pdf?alt=media&token=15ccd06c-acc1-4d11-abd9-5abcec1a49b5',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/9-Minimalist%20White%20and%20Grey%20Professional%20Resume.pdf?alt=media&token=3e46e640-e632-4ae9-b003-d4a151ab3fe5',
    'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/10-Simple%20Resume%20in%20White%20and%20Pastel%20Blue%20Minimalist%20Style.pdf?alt=media&token=8d787741-37bb-440a-b6c9-c1fd3664bdba',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              itemCount: imageUrls.length,
              options: CarouselOptions(
                height: 500.0,
                enableInfiniteScroll: false,
                viewportFraction: 0.872,
                enlargeCenterPage: true,
                pageSnapping: true,
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
                  color: Colors.white,
                  child: Column(
                    children: [
                      Card(
                        elevation: 16.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                            height: 300.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        margin: EdgeInsets.only(top: 36.0),
                        child: ElevatedButton(
                          onPressed: () => _launchPDF(pdfFileUrls[_currentIndex]),
                          child: Text('Download PDF'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Positioned(
        bottom: 32.0, // Adjusted the bottom padding
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
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
                  color: Colors.grey.withOpacity(index == _currentIndex ? 1.0 : 0.4),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchPDF(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print("Error launching PDF: $e");
    }
  }
}
