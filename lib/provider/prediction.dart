import 'package:flutter/foundation.dart';

class Prediction with ChangeNotifier {
  List<dynamic> _diagnosisPredicted;
  bool _showHud = false;

  void setPredictedDiagnosisJson(List<dynamic> json) {
    _diagnosisPredicted = json;
    notifyListeners();
  }

  void showModalHud() {
    _showHud = !_showHud;
    notifyListeners();
  }

  List<dynamic> getPredictionJson() => _diagnosisPredicted;
  bool getShowHud() => _showHud;
}
