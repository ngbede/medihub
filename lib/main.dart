import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/checkup.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckUp>(
      create: (context) => CheckUp(),
      child: MaterialApp(
        home: Scaffold(
          body: Layout(),
        ),
      ),
    );
  }
}
