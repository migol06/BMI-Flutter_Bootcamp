import 'dart:math';

class BMICalculator {
  double weight;
  double height;
  late double _bmi;

  BMICalculator({
    required this.weight,
    required this.height,
  });

  calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMILabel() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi <= 18.5) {
      return 'Underweight';
    } else {
      return 'Normal Weight';
    }
  }

  String getBMIDesc() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi <= 18.5) {
      return 'You have a lower than a normal body weight. You can eat a bit more';
    } else {
      return 'You have a normal body weight. Good Job!';
    }
  }
}
