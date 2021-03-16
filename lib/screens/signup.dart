import 'package:flutter/material.dart';
import 'package:medihub/admin/screen/doclogin.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/screens/login.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/models/useraccount.dart';

//TODO:handle email/account already in use exception
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFFC0F9E3),
        body: ModalProgressHUD(
          inAsyncCall: false, // Provider.of<Spin>(context).getWheel(),
          child: Container(
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
                    left: 30.0,
                    right: 30.0,
                    top: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create Account",
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: InputField(
                            hint: "First Name",
                            keyboard: TextInputType.text,
                            fieldType: Field.firstName,
                            horLen: 10,
                          )),
                          Expanded(
                            child: InputField(
                              hint: "Last Name",
                              fieldType: Field.lastName,
                              horLen: 10,
                              keyboard: TextInputType.text,
                            ),
                          )
                        ],
                      ),
                      InputField(
                        hint: "Email Address",
                        fieldType: Field.email,
                        horLen: 10,
                        keyboard: TextInputType.emailAddress,
                      ),
                      InputField(
                        hint: "Phone Number",
                        horLen: 10,
                        fieldType: Field.phoneNumber,
                        keyboard: TextInputType.phone,
                      ),
                      InputField(
                        hint: "Password",
                        fieldType: Field.password,
                        keyboard: TextInputType.visiblePassword,
                        horLen: 10,
                        iconVisible: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                            child: Text(
                              " Login",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // if (Provider.of<UserAccount>(context, listen: false)
                    //     .fieldsNotNull()) {
                    // Provider.of<Spin>(context, listen: false)
                    //     .changeWheel();
                    print("In");
                    try {
                      final _newUser =
                          await auth.createUserWithEmailAndPassword(
                        email: Provider.of<UserAccount>(context, listen: false)
                            .getEmail(),
                        password:
                            Provider.of<UserAccount>(context, listen: false)
                                .getPassword(),
                      );
                      //For every new user store their additional info in cloud firestore

                      if (_newUser != null) {
                        // Provider.of<Spin>(context, listen: false)
                        //     .changeWheel();
                        store.collection("users").doc(auth.currentUser.uid).set(
                          {
                            "email": Provider.of<UserAccount>(
                              context,
                              listen: false,
                            ).getEmail(),
                            "userId": _newUser.user.uid,
                            "firstName": Provider.of<UserAccount>(
                              context,
                              listen: false,
                            ).getFirstName(),
                            "lastName": Provider.of<UserAccount>(
                              context,
                              listen: false,
                            ).getLastName(),
                            "phoneNumber": Provider.of<UserAccount>(
                              context,
                              listen: false,
                            ).getPhoneNumber(),
                          },
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Layout(),
                          ),
                        );
                      }
                    } catch (e) {
                      print("Hello $e"); //TODO: handle login errors
                    }
                  },
                  // },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF35D4C0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 100),
                      child: Text(
                        "REGISTER",
                        textAlign: TextAlign.center,
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
      ),
    );
  }
}
