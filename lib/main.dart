import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Medihub"),
          ),
        ),
        body: Layout(),
      ),
    );
  }
}
