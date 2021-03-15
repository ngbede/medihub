import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCF0FE),
      appBar: AppBar(
        title: Text("Medical History"),
        backgroundColor: Color(0XFF35D4C0),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: store.collection("diagnosisHistory").snapshots(),
              builder: (context, snapshot) {
                List<Padding> historyStreams = [];
                if (snapshot.hasData) {
                  final doclist = snapshot.data.docs;
                  for (var userdata in doclist) {
                    if (userdata.data()["userId"] == auth.currentUser.uid) {
                      final description = userdata.data()["description"];
                      final gender = userdata.data()["gender"];
                      final patientName = userdata.data()["patientName"];
                      final percentage = userdata.data()["percentage"];
                      final sicknessName = userdata.data()["sicknessName"];
                      final symptoms = userdata.data()["symptoms"];
                      final yearOfBirth = userdata.data()["yearOfBirth"];
                      historyStreams.add(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                          Text("Patient name: $patientName")),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Gender: $gender")),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                          Text("Year of Birth: $yearOfBirth")),
                                  Divider(),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                          Text("Sickness Name: $sicknessName")),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Description: $description")),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Confidence level: $percentage")),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Symptoms: $symptoms")),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "No Medical History To show now",
                        ),
                        Icon(
                          FluentIcons.emoji_sad_24_regular,
                          size: 20,
                        ),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: ListView(
                    children: historyStreams,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
