import 'package:flutter/material.dart';
import 'package:medihub/screens/signup.dart';
import 'package:medihub/widgets/inputfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

enum Field { email, password }

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFC0F9E3),
        body: ModalProgressHUD(
          inAsyncCall: false, //Provider.of<Spin>(context).getWheel(),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Login",
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
                          InputField(
                            hint: "E-mail",
                            keyboard: TextInputType.emailAddress,
                            // dataField: Field.email,
                          ),
                          InputField(
                            hint: "Password",
                            keyboard: TextInputType.visiblePassword,
                            //dataField: Field.password,
                            iconVisible: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0XFF35D4C0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Provider.of<Spin>(context, listen: false)
                              //     .changeWheel();
                              // final _login = await auth()
                              //     .signInWithEmailAndPassword(
                              //         email: Provider.of<Account>(context,
                              //                 listen: false)
                              //             .getUser()
                              //             .email,
                              //         password: Provider.of<Account>(context,
                              //                 listen: false)
                              //             .getUser()
                              //             .password);
                              // if (_login != null) {
                              //   Provider.of<Spin>(context, listen: false)
                              //       .changeWheel();
                              //   SharedPreferences prefs =
                              //       await SharedPreferences.getInstance();
                              //   prefs.setString(
                              //       "email",
                              //       Provider.of<Account>(context, listen: false)
                              //           .getUser()
                              //           .email);
                              //   print(prefs.getString("email"));
                              //   Navigator.pushNamed(context, "layout");
                              // } else {
                              //   print("Invalid field");
                              // }
                              print("Sign in action");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0XFF35D4C0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New User?",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
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

//  decoration: BoxDecoration(
//           // adds background image
//           image: DecorationImage(
//             image: AssetImage('images/background.png'),
//             fit: BoxFit.fill,
//           ),
