import 'package:flutter/material.dart';
import 'package:medihub/models/symptoms.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tags/flutter_tags.dart';

// TODO: Refactor code
// TODO: Implement Network request to get diagnosis from API
class Confirmation extends StatelessWidget {
  final List<Symptom> userSymptomsList;
  Confirmation({@required this.userSymptomsList});
  final GlobalKey<TagsState> _tagKey = GlobalKey<TagsState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0XFFCCCFD1,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${Provider.of<CheckUp>(context).getName().toUpperCase()}"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0XFFCCCFD1,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${Provider.of<CheckUp>(context).getPhoneNumber()}"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0XFFCCCFD1,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${Provider.of<CheckUp>(context).getGender().toUpperCase()}"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Year of Birth",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0XFFCCCFD1,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${Provider.of<CheckUp>(context).getYearOfBirth()}"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Symptoms",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0XFFCCCFD1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Tags(
                      key: _tagKey,
                      itemCount: userSymptomsList.length,
                      columns: 4,
                      itemBuilder: (index) {
                        return ItemTags(
                            activeColor: Color(0XFF35D4C0),
                            index: index,
                            title: userSymptomsList[index].name);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
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
        ],
      ),
    );
  }
}
