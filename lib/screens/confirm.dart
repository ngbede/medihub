import 'package:flutter/material.dart';
import 'package:medihub/config/textstyles.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:medihub/provider/prediction.dart';
import 'package:medihub/screens/result.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:medihub/services/network.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:medihub/widgets/aligninfo.dart';

class Confirmation extends StatelessWidget {
  final List<String> userSymptomsList;
  Confirmation({@required this.userSymptomsList});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TagsState> tagKey = GlobalKey<TagsState>();
    return ModalProgressHUD(
      inAsyncCall: Provider.of<Prediction>(context).getShowHud(),
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Color(0XFFCCCFD1), //(0XFF35D4C0),
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(
            0XFF35D4C0,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF35D4C0),
          title: Text("Confirm Details"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 60.0,
                bottom: 20,
                right: 10,
                left: 10,
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                    children: [
                      AlignInfo(
                        name: "Name",
                        infoStyle: confirmStyleHeading,
                      ),
                      AlignInfo(
                        name: Provider.of<CheckUp>(context)
                            .getName()
                            .toUpperCase(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AlignInfo(
                        name: "Gender",
                        infoStyle: confirmStyleHeading,
                      ),
                      AlignInfo(
                        name: Provider.of<CheckUp>(context)
                            .getGender()
                            .toUpperCase(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AlignInfo(
                        name: "Year of Birth",
                        infoStyle: confirmStyleHeading,
                      ),
                      AlignInfo(
                        name:
                            "${Provider.of<CheckUp>(context).getYearOfBirth()}",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      AlignInfo(
                        name: "Symptoms",
                        infoStyle: confirmStyleHeading,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Tags(
                        key: tagKey,
                        itemCount: userSymptomsList.length,
                        columns: 4,
                        itemBuilder: (index) {
                          return ItemTags(
                              activeColor: Color(0XFF35D4C0),
                              index: index,
                              title: userSymptomsList[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Provider.of<Prediction>(context, listen: false).showModalHud();
                List<int> chosenSymptoms = [];
                Provider.of<CheckUp>(context, listen: false)
                    .getSymptoms()
                    .values
                    .forEach(
                  (element) {
                    chosenSymptoms.add(element["ID"]);
                  },
                );
                Map<String, String> queryStrings = {
                  "language": "en-gb",
                  "symptoms": "$chosenSymptoms",
                  "gender":
                      "${Provider.of<CheckUp>(context, listen: false).getGender()}",
                  "year_of_birth":
                      "${Provider.of<CheckUp>(context, listen: false).getYearOfBirth()}",
                };
                try {
                  List<dynamic> jsonData = await Network.getJson(queryStrings);
                  if (jsonData != null) {
                    Provider.of<Prediction>(context, listen: false)
                        .setPredictedDiagnosisJson(jsonData);
                    Provider.of<Prediction>(context, listen: false)
                        .showModalHud();
                    print(
                      Provider.of<Prediction>(context, listen: false)
                          .getPredictionJson(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicalDiagnosis(
                          userSymptomsList: userSymptomsList,
                        ),
                      ),
                    );
                  } else {
                    print("Unable to get the Data at this time");
                    Provider.of<Prediction>(context, listen: false)
                        .showModalHud();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicalDiagnosis(
                          userSymptomsList: userSymptomsList,
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
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
                      "GET DIAGNOSIS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
