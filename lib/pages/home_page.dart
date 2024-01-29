import 'package:flutter/material.dart';

import '../drawer/main_drawer.dart';
import '../tools/navigation.dart';
import 'sample_resume_page.dart';
import 'show_data.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.3; // Adjust the width factor as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Harbour, your harbor for navigating the job market! We\'re here to guide you on your quest for meaningful employment. Let\'s set sail on a journey together to discover personalized resources for your career aspirations.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            onPressed: () => goTo(const ShowData(), context),
            tooltip: 'Show Jobs',
            label: SizedBox(
              width: buttonWidth,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 4),
                  Text("Show Jobs"),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton.extended(
            onPressed: () => goTo(const Resume(), context),
            tooltip: 'Make resume',
            label: SizedBox(
              width: buttonWidth,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 4),
                  Text("Resume Maker"),
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
