import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:medihub/models/symptoms.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SelectSymptoms extends StatefulWidget {
  bool isSelected;
  SelectSymptoms({this.isSelected = false});
  @override
  _SelectSymptomsState createState() => _SelectSymptomsState();
}

class _SelectSymptomsState extends State<SelectSymptoms> {
  List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(symptomsList.length, false);
  }

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
                      value: _isChecked[index],
                      onChanged: (newvalue) {
                        setState(
                          () {
                            _isChecked[index] = newvalue;
                          },
                        );
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
                  int i = 0;
                  Symptom mySymptom = Symptom();
                  print(i);
                  print(_isChecked);
                  for (bool value in _isChecked) {
                    if (value == true) {
                      mySymptom.id = symptomsList[i]["ID"];
                      mySymptom.name = symptomsList[i]["Name"];
                      Provider.of<CheckUp>(context, listen: false)
                          .setSymptoms(mySymptom);
                    }
                    print(value);
                    i++;
                  }
                  print(Provider.of<CheckUp>(context, listen: false)
                      .getSymptoms());
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
