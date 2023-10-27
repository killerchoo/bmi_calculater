import 'dart:math';

class calculaterFunc {
  calculaterFunc(
    this.height,
    this.weight,
  );
  final int height;
  final int weight;
  late double _bmi;

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(2);
  }

  String GetResult() {
    if (_bmi <= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String GetTips() {
    if (_bmi <= 25) {
      return 'your health contition was very poor, increse your Dit asap';
    } else if (_bmi > 18.5) {
      return 'your health contition was very good keep your Dit proprely';
    } else {
      return 'your health contition was very poor and increase your food quality and quntity';
    }
  }
}
