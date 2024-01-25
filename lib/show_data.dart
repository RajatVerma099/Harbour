import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData>{

  void addJob() {
    FirebaseFirestore.instance.collection("Jobs").add({
      "title":"Fuck others",
      "desc": "You have to fuck others' life",
      "company":"Out of your league",
      "apply-link":"fuckyou.yomama.org",
      "experience":"above god",
      "location":"behind yo mama",
      "more-info-link":"youwantanotherlink.com"
    });
  }

  Widget loadingIndicator() {
    var loadingIndicators = const [
      CircularProgressIndicator(),
      LinearProgressIndicator(),
    ];
    var index = Random().nextInt(loadingIndicators.length);
    return loadingIndicators[index];
  }

  void removeJob(jobID) {
    print("job with jobID $jobID deleted");
    FirebaseFirestore.instance.collection("Jobs").doc(jobID).delete();
  }

  @override
  Widget build(BuildContext context) {
    var jobs = FirebaseFirestore.instance.collection("Jobs");
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: "Add new Job",
            onPressed: addJob,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Job Opportunities"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: jobs.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loadingIndicator(),);
            }
            else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        trailing: IconButton(onPressed: () {
                          removeJob(snapshot.data!.docs[index].reference.id);
                        }, icon: const Icon(Icons.delete), 
                        ),
                        title: Text("${snapshot.data!.docs[index]["title"]}"),
                        subtitle: Text(
                            "${snapshot.data!.docs[index]["desc"]}"),
                      ),
                    );
                },
                itemCount: snapshot.data!.docs.length,
                );
              }
              else {
                return const Center(
                  child: Text("No Jobs"),
                );
              }
            }
            else {
              return const Center(
                  child: Text("No Connection"),
                );
            }
          }
      ),
    );
  }}