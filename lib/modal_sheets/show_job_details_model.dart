import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

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
  
  Future<void> _onOpen(LinkableElement link) async {
    print("Linking!!!");
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: const TextStyle(fontSize: 30,),),
            Text(company),
            const SizedBox(height: 20),
            Text(desc),
            const SizedBox(height: 20),
            Linkify(
              onOpen: _onOpen,
              text: applyLink,
              options: const LinkifyOptions(
                humanize: true,
              ),
            ),
            Text("Experience: $experience"),
            Text("At: $location"),
            Text("More Info: $moreInfoLink"),
          ],
        ),
    );
  }
}