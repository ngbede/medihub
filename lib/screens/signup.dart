import 'package:flutter/material.dart';
import 'package:medihub/screens/login.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
            child: Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 50, bottom: 50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(fontSize: 25),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/playstore.png"),
                              radius: 30,
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                              child: InputField(
                            hint: "First Name",
                            //dataField: Field.name,
                            keyboard: TextInputType.text,
                            horLen: 10,
                          )),
                          Expanded(
                            child: InputField(
                              hint: "Last Name",
                              //dataField: Field.surName,
                              horLen: 10,
                              keyboard: TextInputType.text,
                            ),
                          )
                        ],
                      ),

                      InputField(
                        hint: "Email Address",
                        // dataField: Field.email,
                        horLen: 10,
                        keyboard: TextInputType.emailAddress,
                      ),
                      InputField(
                        hint: "Phone Number",
                        // dataField: Field.phone,
                        horLen: 10,
                        keyboard: TextInputType.phone,
                      ),
                      InputField(
                        hint: "Password",
                        //  dataField: Field.password,
                        keyboard: TextInputType.visiblePassword,
                        horLen: 10,
                        iconVisible: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Passwords must be at least 6 characters.",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("signup action");
                          // print("Sign up button pressed");
                          // if (Provider.of<Account>(context, listen: false)
                          //     .fieldsNotNull()) {
                          //   Provider.of<Spin>(context, listen: false)
                          //       .changeWheel();
                          //   try {
                          //     final _newUser = await auth()
                          //         .createUserWithEmailAndPassword(
                          //             email: Provider.of<Account>(context,
                          //                     listen: false)
                          //                 .getUser()
                          //                 .email,
                          //             password: Provider.of<Account>(context,
                          //                     listen: false)
                          //                 .getUser()
                          //                 .password);
                          //     //For every new user store their additional info in cloud firestore
                          //     store().collection("users").add(
                          //       {
                          //         "email":
                          //             Provider.of<Account>(context, listen: false)
                          //                 .getUser()
                          //                 .email,
                          //         "id": _newUser.user.uid,
                          //         "name":
                          //             Provider.of<Account>(context, listen: false)
                          //                 .getUser()
                          //                 .name,
                          //         "surname":
                          //             Provider.of<Account>(context, listen: false)
                          //                 .getUser()
                          //                 .surName,
                          //         "phoneNumber":
                          //             Provider.of<Account>(context, listen: false)
                          //                 .getUser()
                          //                 .phoneNumber
                          //       },
                          //     );
                          //     if (_newUser != null) {
                          //       Provider.of<Spin>(context, listen: false)
                          //           .changeWheel();
                          //       Navigator.pushNamed(context, "layout");
                          //     }
                          //   } catch (e) {
                          //     print(e);
                          //   }
                          // }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF35D4C0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              "Create Account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
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
                      // Text(
                      //   "By signing up you accept our terms and conditions & privacy policy",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(color: Color(0XFFCDD8EA)),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
