import 'package:flutter/material.dart';
import 'package:medihub/models/useraccount.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/checkup.dart';

import '../constants.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextInputType keyboard;
  final Field fieldType;
  final bool iconVisible;
  final double horLen;
  final double verLen;
  final int maxlen;
  InputField({
    @required this.hint,
    @required this.keyboard,
    this.fieldType,
    this.horLen = 20.0,
    this.verLen = 10.0,
    this.iconVisible = false,
    this.maxlen,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

bool hidePassword = true;

class _InputFieldState extends State<InputField> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horLen,
        vertical: widget.verLen,
      ),
      child: TextField(
        maxLength: widget.maxlen,
        controller: _controller,
        onChanged: (value) {
          if (widget.fieldType == Field.email) {
            Provider.of<UserAccount>(context, listen: false).setEmail(value);
          } else if (widget.fieldType == Field.firstName) {
            Provider.of<UserAccount>(context, listen: false)
                .setFirstName(value);
          } else if (widget.fieldType == Field.lastName) {
            Provider.of<UserAccount>(context, listen: false).setLastName(value);
          } else if (widget.fieldType == Field.phoneNumber) {
            Provider.of<UserAccount>(context, listen: false)
                .setPhoneNumber(value);
          } else if (widget.fieldType == Field.password) {
            Provider.of<UserAccount>(context, listen: false).setPassword(value);
          } else {
            Provider.of<CheckUp>(context, listen: false).setName(value);
          }
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          errorText: Provider.of<CheckUp>(context).getValidate() == true
              ? widget.keyboard == TextInputType.text
                  ? Provider.of<CheckUp>(context).getNameEmpty()
                      ? "Name Field must not be empty"
                      : null
                  : Provider.of<CheckUp>(context).getPhoneEmpty()
                      ? "Invlaid Phone Number"
                      : null
              : null,
          suffixIcon: widget.iconVisible
              ? GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        hidePassword = !hidePassword;
                        print("Hide password: $hidePassword");
                      },
                    );
                  },
                  child: hidePassword
                      ? Icon(
                          Icons.visibility_off_sharp,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.visibility_sharp,
                          color: Colors.teal,
                        ),
                )
              : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFF494949),
            ),
          ),
        ),
        keyboardType: widget.keyboard,
        obscureText: widget.iconVisible ? hidePassword : false,
      ),
    );
  }
}
