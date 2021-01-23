import 'package:flutter/material.dart';

class AlignInfo extends StatelessWidget {
  final String name;
  final TextStyle infoStyle;
  AlignInfo({@required this.name, this.infoStyle});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: infoStyle,
      ),
    );
  }
}
