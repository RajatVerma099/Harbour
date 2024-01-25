import 'package:flutter/material.dart';

class JobDetailsModal extends StatelessWidget {
  
  String title = "";
  String desc = "";
  String company = "";
  String applyLink = "";
  String experience = "";
  String location = "";
  String moreInfoLink = "";

  JobDetailsModal(dynamic job, {super.key}) {
    title = job["title"];
    desc = job["desc"];
    company = job["company"];
    applyLink = job["apply-link"];
    experience = job["experience"];
    location = job["location"];
    moreInfoLink = job["more-info-link"];
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title),
            Text(desc),
            Text(company),
            Text(applyLink),
            Text(experience),
            Text(location),
            Text(moreInfoLink),
          ],
        ),
    );
  }
}