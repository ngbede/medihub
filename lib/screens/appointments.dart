import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: store.collection("appointments").snapshots(),
            builder: (context, snapshot) {
              List<Card> appointmentStreams = [];
              if (snapshot.hasData) {
                final doclist = snapshot.data.docs;
                for (var userdata in doclist) {}
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
            },
          ),
        ],
      ),
    );
  }
}
