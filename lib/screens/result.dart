import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/prediction.dart';
import 'package:medihub/constants.dart';
import 'package:flutter_tags/flutter_tags.dart';

class MedicalDiagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFDCF0FE),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Medical Diagnosis"),
          backgroundColor: Color(
            0XFF35D4C0,
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                try {
                  await store.collection("diaghistory").add(
                    {
                      "patientName":
                          Provider.of<CheckUp>(context, listen: false)
                              .getName(),
                      "sicknessName":
                          Provider.of<Prediction>(context, listen: false)
                              .getPredictionJson()[0]["Issue"]["ProfName"]
                              .toString()
                              .toUpperCase(),
                      "gender": Provider.of<CheckUp>(context, listen: false)
                          .getGender(),
                      "yearOfBirth":
                          Provider.of<CheckUp>(context, listen: false)
                              .getYearOfBirth(),
                      "percentage":
                          Provider.of<Prediction>(context, listen: false)
                              .getPredictionJson()[0]["Issue"]["Accuracy"],
                      "description":
                          Provider.of<Prediction>(context, listen: false)
                              .getPredictionJson()[0]["Issue"]["IcdName"],
                      "symptoms": Provider.of<CheckUp>(context, listen: false)
                          .getSymptoms()
                          .values
                          .toList(),
                      "userId": auth.currentUser.uid,

                      // "contact": Provider.of<CheckUp>(context, listen: false)
                      //     .getPhoneNumber(),
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Layout(),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5.0,
                  color: Color(0XFF35D4C0), //Color(0XFF0B0B0B),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 20, color: Color(0XFFDBE6F2)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            List<dynamic> specialisations =
                Provider.of<Prediction>(context, listen: false)
                    .getPredictionJson()[index]["Specialisation"];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text(
                      //     "${Provider.of<Prediction>(context).getPredictionJson()[index]}"),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DISEASE NAME",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0XFFD2D7FF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["ProfName"].toString().toUpperCase()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0XFFC6CAD6),
                              ),
                            ),
                          ),
                          Text(
                            "${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["Accuracy"]}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green),
                          )
                        ],
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["IcdName"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Specialisations",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Tags(
                          key: index == 0
                              ? tagKey2
                              : index == 1
                                  ? tagKey3
                                  : index == 2
                                      ? tagKey4
                                      : index == 3
                                          ? tagKey5
                                          : tagKey6,
                          itemCount: specialisations.length,
                          columns: 3,
                          itemBuilder: (index) {
                            return ItemTags(
                                activeColor: Color(0XFF35D4C0),
                                index: index,
                                title: specialisations[index]["Name"]);
                          },
                        ),
                      ),
                      // Text(
                      //     ""),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
