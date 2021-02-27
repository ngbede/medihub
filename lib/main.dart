import 'package:flutter/material.dart';
import 'package:medihub/layout.dart';
import 'package:medihub/models/useraccount.dart';
import 'package:medihub/provider/prediction.dart';
import 'package:medihub/provider/progress.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/checkup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider<UserAccount>(
          create: (_) => UserAccount(),
        ),
        ChangeNotifierProvider<Spin>(
          create: (_) => Spin(),
        ),
      ],
      child: MaterialApp(
        home: Layout(),
      ),
    );
  }
}
