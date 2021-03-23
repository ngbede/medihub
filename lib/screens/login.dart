import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/provider/progress.dart';
import 'package:medihub/screens/signup.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/models/useraccount.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFC0F9E3),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<Spin>(context).getWheel(),
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
                    left: 40.0,
                    right: 40.0,
                    top: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Login to Medihub",
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
                        hint: "E-mail",
                        keyboard: TextInputType.emailAddress,
                        fieldType: Field.email,
                        // dataField: Field.email,
                      ),
                      InputField(
                        hint: "Password",
                        keyboard: TextInputType.visiblePassword,
                        fieldType: Field.password,
                        //dataField: Field.password,
                        iconVisible: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Are you a new user?",
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
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              " Sign Up",
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
                    Provider.of<Spin>(context, listen: false).changeWheel();
                    try {
                      final _login = await auth.signInWithEmailAndPassword(
                          email: Provider.of<UserAccount>(
                            context,
                            listen: false,
                          ).getEmail(),
                          password: Provider.of<UserAccount>(
                            context,
                            listen: false,
                          ).getPassword());
                      if (_login != null) {
                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();
                        // prefs.setString(
                        //   "name",
                        //   Provider.of<UserAccount>(context, listen: false)
                        //       .getFirstName(),
                        // );
                        Provider.of<Spin>(context, listen: false).changeWheel();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Layout(),
                          ),
                        );
                      }
                      print(_login);
                    } catch (e) {
                      Provider.of<Spin>(context, listen: false).changeWheel();
                      Fluttertoast.showToast(
                          msg: "Can't login at this time",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0XFF35D4C0),
                          textColor: Colors.white,
                          fontSize: 16.0);
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
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
