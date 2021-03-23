import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:medihub/config/textstyles.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/widgets/aligninfo.dart';
import 'package:medihub/widgets/styletext.dart';

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
                                    child: StyledCard("Name", patientName),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: StyledCard("Gender", gender),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: StyledCard(
                                        "Year of Birth", "$yearOfBirth"),
                                  ),
                                  Divider(),
                                  AlignInfo(
                                    name: "Sickness Name",
                                    infoStyle: confirmStyleHeading,
                                    pad: 15.0,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "$sicknessName",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  AlignInfo(
                                    name: "Description",
                                    infoStyle: confirmStyleHeading,
                                    pad: 15.0,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "$description",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  AlignInfo(
                                    name: "Confidence Level",
                                    infoStyle: confirmStyleHeading,
                                    pad: 15.0,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "$percentage",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  AlignInfo(
                                    name: "Symptoms",
                                    infoStyle: confirmStyleHeading,
                                    pad: 15.0,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "$symptoms",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  if (historyStreams.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You have no medical diagnosis history",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              FluentIcons.emoji_sad_24_regular,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "No Diagnosis History To show for now",
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
