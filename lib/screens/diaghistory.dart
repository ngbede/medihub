import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: store.collection("diagnosisHistory").snapshots(),
              builder: (context, snapshot) {
                List<Card> historyStreams = [];
                if (snapshot.hasData) {
                  final doclist = snapshot.data.docs;
                  for (var userdata in doclist) {
                    if (userdata.id == auth.currentUser.uid) {
                      final description = userdata.data()["description"];
                      final gender = userdata.data()["gender"];
                      final patientName = userdata.data()["patientName"];
                      final percentage = userdata.data()["percentage"];
                      final sicknessName = userdata.data()["sicknessName"];
                      final symptoms = userdata.data()["symptoms"];
                      final yearOfBirth = userdata.data()["yearOfBirth"];
                      historyStreams.add(
                        Card(
                          child: Column(
                            children: [
                              Text("Patient name: $patientName"),
                              Text("Gender: $gender"),
                              Text("Year of Birth: $yearOfBirth"),
                              Divider(),
                              Text("Sickness Name: $sicknessName"),
                              Text("Description: $description"),
                              Text("Confidence level: $percentage"),
                              Text("Symptoms: $symptoms"),
                            ],
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
