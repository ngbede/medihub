import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:medihub/models/symptoms.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';

class SelectSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Symptoms"),
        backgroundColor: Color(0XFF35D4C0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(FluentIcons.search_20_regular),
              onPressed: () {
                print("Implement search"); //TODO: add search feature
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                child: ListView.builder(
                  itemCount: 270,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      activeColor: Color(0XFF35D4C0),
                      title: Text(symptomsList[index]["Name"]),
                      value:
                          Provider.of<CheckUp>(context).getCheckList()[index],
                      onChanged: (newvalue) {
                        Provider.of<CheckUp>(context, listen: false)
                            .checkItem(index, newvalue);
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print(
                    Provider.of<CheckUp>(context, listen: false).getCheckList(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    //width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0XFF35D4C0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
