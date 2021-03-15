import 'package:flutter/material.dart';
import 'package:medihub/admin/adminusers.dart';
import 'package:medihub/admin/models/doctor.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0XFF35D4C0),
              title: Text(
                "Welcome Dr. ${adminUsers[Provider.of<Doctor>(context).getDocId()]["name"]}",
              ),
              bottom: TabBar(
                controller: TabController(length: 2, vsync: null),
                tabs: [
                  Tab(
                    text: "Requests",
                  ),
                  Tab(
                    text: "Appointments",
                  )
                ],
              )),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Text("Request cards navigate to shedule screen"),
              ),
              SingleChildScrollView(
                child: Text("View appointments that have been scheduled"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
