import 'package:flutter/foundation.dart';

class Spin with ChangeNotifier {
  bool _spinWheel = false;

  void changeWheel() {
    _spinWheel = !_spinWheel;
    notifyListeners();
  }

  bool getWheel() => _spinWheel;
}
