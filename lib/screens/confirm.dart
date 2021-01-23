import 'package:flutter/material.dart';
import 'package:medihub/config/textstyles.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:medihub/provider/prediction.dart';
import 'package:medihub/screens/illness.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:medihub/services/network.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:medihub/widgets/aligninfo.dart';
import 'package:medihub/constants.dart';

// TODO: Refactor code
class Confirmation extends StatelessWidget {
  final List<String> userSymptomsList;
  Confirmation({@required this.userSymptomsList});

  @override
  Widget build(BuildContext context) {
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
                    // mainAxisAlignment: MainAxisAlignment.,
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
                        name: "Phone Number",
                        infoStyle: confirmStyleHeading,
                      ),
                      AlignInfo(
                        name: Provider.of<CheckUp>(context).getPhoneNumber(),
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
                      Divider(),
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
                if (Provider.of<Prediction>(context, listen: false)
                        .getPredictionJson() ==
                    null) {
                  try {
                    List<dynamic> jsonData =
                        await Network.getJson(queryStrings);
                    if (jsonData != null) {
                      Provider.of<Prediction>(context, listen: false)
                          .setPredictedDiagnosisJson(jsonData);
                      Provider.of<Prediction>(context, listen: false)
                          .showModalHud();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalDiagnosis(),
                        ),
                      );
                    } else {
                      print("Unable to get the Data at this time");
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {
                  print("from Provider");
                  print(
                    Provider.of<Prediction>(context, listen: false)
                        .getPredictionJson(),
                  );
                  Provider.of<Prediction>(context, listen: false)
                      .showModalHud();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicalDiagnosis(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.0),
                child: Card(
                  elevation: 3.0,
                  color: Color(0XFF35D4C0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        "Get Diagnosis",
                        style: TextStyle(fontSize: 20),
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
