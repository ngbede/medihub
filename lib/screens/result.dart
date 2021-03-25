import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/prediction.dart';
import 'package:medihub/constants.dart';
import 'package:flutter_tags/flutter_tags.dart';

class MedicalDiagnosis extends StatelessWidget {
  final List<String> userSymptomsList;
  MedicalDiagnosis({@required this.userSymptomsList});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<TagsState> tagKey2 = GlobalKey<TagsState>();
    return Scaffold(
      backgroundColor: Color(0XFFDCF0FE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Medical Diagnosis"),
        backgroundColor: Color(
          0XFF35D4C0,
        ),
      ),
      body: Provider.of<Prediction>(context, listen: false)
              .getPredictionJson()
              .isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                  "${Provider.of<Prediction>(context, listen: false).getPredictionJson()[0]["Issue"]["ProfName"].toString().toUpperCase()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0XFFC6CAD6),
                                  ),
                                ),
                              ),
                              Text(
                                "${Provider.of<Prediction>(context, listen: false).getPredictionJson()[0]["Issue"]["Accuracy"]}%",
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
                              "${Provider.of<Prediction>(context, listen: false).getPredictionJson()[0]["Issue"]["IcdName"]}",
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
                              key: tagKey2,
                              itemCount: 1, //specialisations.length,
                              columns: 3,
                              itemBuilder: (index) {
                                return ItemTags(
                                    activeColor: Color(0XFF35D4C0),
                                    index: index,
                                    title: Provider.of<Prediction>(context,
                                                listen: false)
                                            .getPredictionJson()[0]
                                        ["Specialisation"][index]["Name"]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await store.collection("diagnosisHistory").add(
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
                          "symptoms": userSymptomsList,
                          "userId": auth.currentUser.uid,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF35D4C0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  child: Text(
                    "No Diagnostic Data at the moment",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF35D4C0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      child: Text(
                        "Go Back Home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Layout(),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
