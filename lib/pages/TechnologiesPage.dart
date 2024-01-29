import 'package:flutter/material.dart';

class TechnologiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technologies Used'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TechnologyCard(
              technologyName: 'Flutter',
              description: 'UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
              imageUrl: 'assets/flutter_logo.png',
            ),
            SizedBox(height: 16),
            TechnologyCard(
              technologyName: 'Dart',
              description: 'Programming language optimized for building mobile, desktop, server, and web applications.',
              imageUrl: 'assets/dart_logo.png',
            ),
            SizedBox(height: 16),
            TechnologyCard(
              technologyName: 'Firebase',
              description: 'Backend-as-a-Service (BaaS) platform developed by Google for creating mobile and web applications.',
              imageUrl: 'assets/firebase_logo.png',
            ),
            // Add more TechnologyCard widgets as needed
          ],
        ),
      ),
    );
  }
}

class TechnologyCard extends StatelessWidget {
  final String technologyName;
  final String description;
  final String imageUrl;

  const TechnologyCard({
    required this.technologyName,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  technologyName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TechnologiesPage(),
    ),
  );
}
