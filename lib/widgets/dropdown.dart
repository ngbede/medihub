import 'package:flutter/material.dart';
import 'package:medihub/constants.dart';
import 'package:provider/provider.dart';
import 'package:medihub/provider/checkup.dart';

DropdownButton androidMenu(BuildContext context, Dropdown property) {
  List<DropdownMenuItem<dynamic>> genders = [];
  List<DropdownMenuItem<dynamic>> years = [];
  if (property == Dropdown.gender) {
    for (var gender in genderList) {
      var option = DropdownMenuItem(
        child: Text(
          gender.toUpperCase(),
        ),
        value: gender,
      );
      genders.add(option);
    }
  } else {
    for (int year = 1950; year <= 2021; year++) {
      DropdownMenuItem option = DropdownMenuItem(
        child: Text("$year"),
        value: year,
      );
      years.add(option);
    }
  }

  return DropdownButton(
    items: property == Dropdown.gender ? genders : years,
    value: property == Dropdown.gender
        ? Provider.of<CheckUp>(context).getGender()
        : Provider.of<CheckUp>(context).getYearOfBirth(),
    onChanged: (value) {
      if (property == Dropdown.gender) {
        Provider.of<CheckUp>(context, listen: false).setGender(value);
      } else {
        Provider.of<CheckUp>(context, listen: false).setYearOfBirth(value);
      }
    },
  );
}
