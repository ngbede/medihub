import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:medihub/screens/picksymptoms.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medihub/widgets/dropdown.dart';

class Diagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFC0F9E3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Text(
                      "Input Information",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InputField(
                    hint: "Name",
                    maxlen: 30,
                    keyboard: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // InputField(
                  //   hint: "Phone Number",
                  //   maxlen: 11,
                  //   keyboard: TextInputType.phone,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Image.asset("images/genders.png"),
                    title: Text(
                      "Gender",
                    ),
                    trailing: Container(
                      width: 100,
                      height: 100,
                      child: androidMenu(context, Dropdown.gender),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Image.asset("images/calendar.png"),
                    title: Text(
                      "Year of Birth",
                    ),
                    trailing: Container(
                      width: 100,
                      height: 100,
                      child: androidMenu(context, Dropdown.year),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<CheckUp>(context, listen: false)
                          .verifyNameInput();
                      // Provider.of<CheckUp>(context, listen: false)
                      //     .verifyPhoneInput();
                      Provider.of<CheckUp>(context, listen: false).validate();
                      if (Provider.of<CheckUp>(context, listen: false)
                              .getNameEmpty() ==
                          false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectSymptoms(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 110.0,
                      ),
                      child: Card(
                        elevation: 5.0,
                        color: Color(0XFF0B0B0B),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0XFFDBE6F2)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
