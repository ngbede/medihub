import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:medihub/models/symptoms.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:medihub/screens/confirm.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

// TODO: Refactor code
class SelectSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${Provider.of<CheckUp>(context).getSelectedSymptoms()} Selected Symptoms"),
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
                    Provider.of<CheckUp>(context, listen: false).getSymptoms(),
                  );
                  if (Provider.of<CheckUp>(context, listen: false)
                          .getSelectedSymptoms() >
                      0) {
                    List<Symptom> userSymptoms = [];
                    Provider.of<CheckUp>(context, listen: false)
                        .getSymptoms()
                        .forEach((key, value) {
                      Symptom mySymptom = Symptom();
                      mySymptom.id =
                          Provider.of<CheckUp>(context, listen: false)
                              .getSymptoms()[key]["ID"];
                      mySymptom.name =
                          Provider.of<CheckUp>(context, listen: false)
                              .getSymptoms()[key]["Name"];
                      userSymptoms.add(mySymptom);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Confirmation(
                          userSymptomsList: userSymptoms,
                        ),
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Pick a symptom",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0XFF35D4C0),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 10.0,
                  ),
                  child: Card(
                    elevation: 3.0,
                    color: Color(0XFF35D4C0),
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
