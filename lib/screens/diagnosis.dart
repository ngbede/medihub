import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:provider/provider.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:medihub/screens/picksymptoms.dart';
import 'package:medihub/widgets/dropdown.dart';

class Diagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Input Information"),
        backgroundColor: Color(0XFF35D4C0),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0XFFC0F9E3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  hint: "Name",
                  maxlen: 30,
                  keyboard: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
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
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFF35D4C0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        child: Center(
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
        ),
      ),
    );
  }
}
