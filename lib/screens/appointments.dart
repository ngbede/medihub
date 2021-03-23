import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/widgets/styletext.dart';

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCF0FE),
      appBar: AppBar(
        title: Text("Medical Appointments"),
        backgroundColor: Color(0XFF35D4C0),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: store.collection("appointments").snapshots(),
            builder: (context, snapshot) {
              List<Padding> appointmentStreams = [];
              if (snapshot.hasData) {
                final doclist = snapshot.data.docs;
                for (var userdata in doclist) {
                  if (userdata.data()["patient"] == auth.currentUser.uid) {
                    final String docName = userdata.data()["doctorName"];
                    final String hospitalName = userdata.data()["hospitalName"];
                    final String location = userdata.data()["location"];
                    final date = userdata.data()["date"];
                    //final state = userdata.data()["State"];
                    final String room = userdata.data()["room"];
                    final String time = userdata.data()["time"];
                    final String ward = userdata.data()["ward"];
                    appointmentStreams.add(
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Doctor", docName),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Hospital", hospitalName),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Location", location),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Ward", ward),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Room", room),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Date", date),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: StyledCard("Time", time),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }
                if (appointmentStreams.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You have no medical appointments yet",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            FluentIcons.cloud_20_regular,
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
                      Text("You have no medical appointments yet"),
                      Icon(
                        FluentIcons.cloud_20_regular,
                        size: 20,
                      ),
                    ],
                  ),
                );
              }
              return Expanded(
                child: ListView(
                  children: appointmentStreams,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
