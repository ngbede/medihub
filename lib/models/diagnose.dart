import 'package:medihub/models/symptoms.dart';

class Diagnosis {
  List<Symptom> symptoms;
  bool gender;
  int yearOfBirth;
  Diagnosis({
    this.symptoms,
    this.gender,
    this.yearOfBirth,
  });
}
