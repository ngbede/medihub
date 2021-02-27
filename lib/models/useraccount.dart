import 'package:flutter/foundation.dart';

class UserAccount with ChangeNotifier {
  String _firstName;
  String _lastName;
  String _email;
  String _phoneNumber;
  String _password;

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool fieldsNotNull() {
    bool emptyField = true;
    if (_email != null &&
        _firstName != null &&
        _lastName != null &&
        _password != null &&
        _phoneNumber != null) {
      emptyField = false;
    }
    return emptyField;
  }

  String getFirstName() => _firstName;
  String getLastName() => _lastName;
  String getEmail() => _email;
  String getPhoneNumber() => _phoneNumber;
  String getPassword() => _password;
}
