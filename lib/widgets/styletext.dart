import 'package:flutter/material.dart';

class StyledCard extends StatelessWidget {
  final String text1;
  final String text2;
  StyledCard(this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "$text1",
        style: TextStyle(
          //  fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0XFFCCCFD1),
        ),
      ),
      trailing: Text(
        "$text2",
        style: TextStyle(
          // fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
