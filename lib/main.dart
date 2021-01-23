import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/provider/prediction.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CheckUp>(
          create: (_) => CheckUp(),
        ),
        ChangeNotifierProvider<Prediction>(
          create: (_) => Prediction(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Layout(),
        ),
      ),
    );
  }
}
