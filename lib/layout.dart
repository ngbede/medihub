import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:medihub/screens/appointments.dart';
import 'package:medihub/screens/home.dart';
import 'package:medihub/screens/diaghistory.dart';
import 'package:medihub/screens/diagnosis.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedScreen = 0;
  List<Widget> _screens = [
    Home(),
    Diagnosis(),
    History(),
    Appointments(),
  ];

  void onTapChangeScreen(int index) {
    setState(
      () {
        _selectedScreen = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFC0F9E3),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: _screens.elementAt(_selectedScreen),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.home_20_regular),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.stethoscope_20_regular),
              label: "Diagnosis",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.person_20_regular),
              label: "Medical History",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.clock_20_regular),
              label: "Appointments",
            ),
          ],
          selectedItemColor: Color(0XFF35D4C0),
          onTap: onTapChangeScreen,
          currentIndex: _selectedScreen,
        ),
      ),
    );
  }
}
