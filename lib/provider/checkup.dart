import 'package:flutter/foundation.dart';
import 'package:medihub/constants.dart';
import 'package:medihub/models/symptoms.dart';

class CheckUp with ChangeNotifier {
  String _gender = "male";
  String _name;
  String _phoneNumber;
  int _yearOfBirth = 1970;
  bool _phoneEmpty = true;
  bool _nameEmpty = true;
  List<Symptom> _symptoms = [];
  bool _validated = false;
  List<bool> _isChecked = List<bool>.filled(symptomsList.length, false);

  void checkItem(int index, bool value) {
    _isChecked[index] = value;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setYearOfBirth(int yearOfBirth) {
    _yearOfBirth = yearOfBirth;
    notifyListeners();
  }

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void setSymptoms(Symptom symptom) {
    _symptoms.add(symptom);
    notifyListeners();
  }

  void verifyNameInput() {
    if (_name != null) {
      if (_name.isNotEmpty) {
        _nameEmpty = false;
      } else {
        _nameEmpty = true;
      }
      notifyListeners();
    }
  }

  void verifyPhoneInput() {
    if (_phoneNumber != null) {
      if (_phoneNumber.isNotEmpty && _phoneNumber.length == 11) {
        _phoneEmpty = false;
      } else {
        _phoneEmpty = true;
      }
      notifyListeners();
    }
  }

  void validate() {
    _validated = true;
  }

  String getGender() => _gender;
  String getName() => _name;
  int getYearOfBirth() => _yearOfBirth;
  String getPhoneNumber() => _phoneNumber;
  List<Symptom> getSymptoms() => _symptoms;
  bool getNameEmpty() => _nameEmpty;
  bool getPhoneEmpty() => _phoneEmpty;
  bool getValidate() => _validated;
  List<bool> getCheckList() => _isChecked;
}
