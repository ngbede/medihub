import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/checkup.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextInputType keyboard;
  final bool iconVisible;
  final double horLen;
  final double verLen;
  InputField({
    @required this.hint,
    @required this.keyboard,
    this.horLen = 20.0,
    this.verLen = 10.0,
    this.iconVisible = false,
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
        maxLength: widget.keyboard == TextInputType.phone ? 11 : 30,
        controller: _controller,
        onChanged: (value) {
          // check for type of keboard to assign value to
          if (widget.keyboard == TextInputType.phone) {
            Provider.of<CheckUp>(context, listen: false).setPhoneNumber(value);
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
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_sharp,
                          color: Colors.teal,
                        ),
                )
              : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFF35D4C0),
            ),
          ),
        ),
        keyboardType: widget.keyboard,
        obscureText: widget.iconVisible ? hidePassword : false,
      ),
    );
  }
}
