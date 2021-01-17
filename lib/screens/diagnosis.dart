import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:medihub/screens/picksymptoms.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medihub/widgets/dropdown.dart';

class Diagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                keyboard: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                hint: "Phone Number",
                keyboard: TextInputType.phone,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(MdiIcons.humanMaleFemale),
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
                leading: Icon(MdiIcons.calendar),
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
                  Provider.of<CheckUp>(context, listen: false)
                      .verifyPhoneInput();
                  Provider.of<CheckUp>(context, listen: false).validate();
                  if (Provider.of<CheckUp>(context, listen: false)
                              .getNameEmpty() ==
                          false &&
                      Provider.of<CheckUp>(context, listen: false)
                              .getPhoneEmpty() ==
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
                    horizontal: 70.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
