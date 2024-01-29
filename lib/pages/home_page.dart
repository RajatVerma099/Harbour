import 'package:flutter/material.dart';

import '../drawer/main_drawer.dart';
import '../tools/navigation.dart';
import 'TechnologiesPage.dart';
import 'sample_resume_page.dart';
import 'show_data.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.6; // Adjust the width factor as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExMWNrZHZydGF5OTAxcnkybm5yOHAzNHlqazd3dmFvMjN0dzJkbGFxNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/26tnlqgsV9gbihbO0/giphy.gif"),
              const Text(
                "Can't find a job? \n\nWelcome to Harbour, your harbor for navigating the job market! We\'re here to guide you on your quest for meaningful employment. Let\'s set sail on a journey together to discover personalized resources for your career aspirations.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(const ShowData(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 8),
                  Text("Show Jobs"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(const Resume(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 8),
                  Text("Resume Maker"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () => goTo(TechnologiesPage(), context),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[200], // Light hue of purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // More curved edges
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 8),
                  Text("Technologies Used"),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
