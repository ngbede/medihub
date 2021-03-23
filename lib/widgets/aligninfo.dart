import 'package:flutter/material.dart';

class AlignInfo extends StatelessWidget {
  final String name;
  final TextStyle infoStyle;
  final double pad;
  AlignInfo({@required this.name, this.infoStyle, this.pad = 1});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: pad),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: infoStyle,
        ),
      ),
    );
  }
}
