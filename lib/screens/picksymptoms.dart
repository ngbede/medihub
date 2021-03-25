import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:medihub/screens/confirm.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF9A999C),
      appBar: AppBar(
        title: Text(
            "${Provider.of<CheckUp>(context).getSelectedSymptoms()} Selected Symptoms"),
        backgroundColor: Color(0XFF35D4C0),
        actions: [
          GestureDetector(
            onTap: () {
              print(
                Provider.of<CheckUp>(context, listen: false).getSymptoms(),
              );
              if (Provider.of<CheckUp>(context, listen: false)
                      .getSelectedSymptoms() >
                  0) {
                List<String> userSymptoms = [];
                Provider.of<CheckUp>(context, listen: false)
                    .getSymptoms()
                    .forEach((key, value) {
                  userSymptoms.add(
                    Provider.of<CheckUp>(context, listen: false)
                        .getSymptoms()[key]["Name"],
                  );
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
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5.0,
              color: Color(0XFF35D4C0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 20, color: Color(0XFFDBE6F2)),
                ),
              ),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.white.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage("images/picksymp.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListView.builder(
                  itemCount: 270,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      activeColor: Color(0XFF35D4C0),
                      title: Text(
                        symptomsList[index]["Name"],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
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
          ],
        ),
      ),
    );
  }
}
