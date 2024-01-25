import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_data.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData>{

  void addJob() {
    FirebaseFirestore.instance.collection("Jobs").add({
      "Title":"Hello 1",
      "description": "Wow 2"
    });
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
              return const Center(child: Text("Loading ..."),);
            }
            else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    trailing: IconButton(onPressed: () {
                      removeJob(snapshot.data!.docs[index].reference.id);
                    }, icon: const Icon(Icons.delete), 
                    ),
                    title: Text("${snapshot.data!.docs[index]["Title"]}"),
                    subtitle: Text(
                        "${snapshot.data!.docs[index]["description"]}"),
                  );
                },
                itemCount: snapshot.data!.docs.length,
                );
              }
              else {
                print("no data");
              }
            }
            else {
              print("no active connection");
            }
            return const Divider();
          }

      ),
    );
  }}