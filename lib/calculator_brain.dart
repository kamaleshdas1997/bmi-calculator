import 'dart:math';


class CalculatorBrain{
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String getCalculateBmi(){
    _bmi = weight / pow(height / 100 , 2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult() {
    if(_bmi >= 18.5 && _bmi <= 25)
    {
      return 'Normal';
    }
    else if(_bmi > 25 && _bmi <=30)
    {
      return 'OverWeight';
    }
    else if (_bmi > 30) {
      return 'Obese';
    }
    else {
      return 'UnderWeight';
    }
  }

  String getInterpretaion(){
    if(_bmi >= 18.5 && _bmi <= 25)
    {
      return 'Your BMI Score is Normal. Good Job';
    }
    else if(_bmi > 25 && _bmi <=30)
    {
      return 'You have a higher than normal body weight. Try to exercise more';
    }
    else if(_bmi > 30)
    {
      return 'You are Obese. Reduce your weight';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }




}