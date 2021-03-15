import 'package:flutter/material.dart';
import 'package:medihub/admin/models/doctor.dart';
import 'package:medihub/admin/screen/portal.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class DocLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFC0F9E3),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage("images/log_reg.jpg"),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topLeft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login as Admin",
                      style: TextStyle(fontSize: 25),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/playstore.png"),
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    InputField(
                      hint: "Doctor ID",
                      keyboard: TextInputType.number,
                      //fieldType: Field.docId,
                      maxlen: 11,
                    ),
                    InputField(
                      hint: "Password",
                      keyboard: TextInputType.number,
                      //fieldType: Field.docPassword,
                      iconVisible: true,
                      maxlen: 6,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Provider.of<Doctor>(context, listen: false)
                      .checkDetails()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminPage()));
                  } else {
                    print("Handle invalid login details");
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
                      "LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
