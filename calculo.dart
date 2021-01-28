
import 'dart:math';

class Calculator {

  Calculator({this.height, this.weight});

  final int height;
  final int weight;



  double _bmi;


  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 16.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }


  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "Diet Please";
    } else if (_bmi > 16.5) {
      return "Your are OK... Keep going";
    } else {
      return "Eat More...";
    }
  }
}