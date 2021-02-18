import 'package:flutter/material.dart';
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
        ),
        body: ListView.builder(
          itemCount:
              Provider.of<Prediction>(context).getPredictionJson().length,
          itemBuilder: (context, index) {
            List<dynamic> specialisations =
                Provider.of<Prediction>(context, listen: false)
                    .getPredictionJson()[index]["Specialisation"];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Card(
                // decoration: BoxDecoration(
                //   color: Color(0XFFFFFFFF),
                //   borderRadius: BorderRadius.circular(20),
                // ),
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
                          "Rank: ${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["Ranking"]}",
                          style: TextStyle(
                              color: Color(0XFFD2D7FF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                                fontSize: 14,
                                color: Color(0XFFC6CAD6),
                              ),
                            ),
                          ),
                          Text(
                            "${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["Accuracy"]}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Provider.of<Prediction>(context)
                                              .getPredictionJson()[index]
                                          ["Issue"]["Accuracy"] >=
                                      70
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "${Provider.of<Prediction>(context).getPredictionJson()[index]["Issue"]["IcdName"]}"),
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Specialisation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
