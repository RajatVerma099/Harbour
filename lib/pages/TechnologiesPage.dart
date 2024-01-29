import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TechnologiesPage extends StatefulWidget {
  const TechnologiesPage({Key? key}) : super(key: key);

  @override
  _TechnologiesPageState createState() => _TechnologiesPageState();
}

class _TechnologiesPageState extends State<TechnologiesPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technologies Used'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TechnologiesList(
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            SizedBox(height: 46),
            PageIndicator(currentIndex: _currentIndex),
          ],
        ),
      ),
    );
  }
}

class TechnologiesList extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;

  const TechnologiesList({Key? key, required this.onIndexChanged})
      : super(key: key);

  @override
  _TechnologiesListState createState() => _TechnologiesListState();
}

class _TechnologiesListState extends State<TechnologiesList> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: technologies.length,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          widget.onIndexChanged(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Center(
          child: TechnologyCard(
            technology: technologies[index],
          ),
        );
      },
    );
  }
}

class TechnologyCard extends StatelessWidget {
  final Technology technology;

  const TechnologyCard({
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.9, // Increased height
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              technology.imageUrl,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7, // Increased height
              fit: BoxFit.contain, // Adjusted to contain
            ),
            SizedBox(height: 16),
            Text(
              technology.technologyName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;

  const PageIndicator({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        technologies.length,
            (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(
              index == currentIndex ? 1.0 : 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class Technology {
  final String technologyName;
  final String imageUrl;

  Technology({
    required this.technologyName,
    required this.imageUrl,
  });
}

final List<Technology> technologies = [
  Technology(
    technologyName: 'Flutter',
    imageUrl: 'https://logowik.com/content/uploads/images/flutter5786.jpg',
  ),
  Technology(
    technologyName: 'Dart',
    imageUrl: 'https://logowik.com/content/uploads/images/google-dart2862.jpg',
  ),
  Technology(
    technologyName: 'Firebase',
    imageUrl: 'https://logowik.com/content/uploads/images/built-with-firebase-light4542.jpg',
  ),
  Technology(
    technologyName: 'Cloud Firestore',
    imageUrl: 'https://static.javatpoint.com/tutorial/firebase/images/firebase-firestore.png',
  ),
  Technology(
    technologyName: 'One Signal',
    imageUrl: 'https://sportal365.com/wp-content/uploads/2022/10/Asset-3.png',
  ),
];

void main() {
  runApp(
    MaterialApp(
      home: TechnologiesPage(),
    ),
  );
}
