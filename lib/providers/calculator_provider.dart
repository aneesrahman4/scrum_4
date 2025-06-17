import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  double? _result;

  double? get result => _result;

  void calculate(String operation, String input1, String input2) {
    final num1 = double.tryParse(input1);
    final num2 = double.tryParse(input2);

    if (num1 == null || num2 == null) {
      if (_result != null) {
        _result = null;
        notifyListeners();
      }
      return;
    }

    double? newResult;
    switch (operation) {
      case '+':
        newResult = num1 + num2;
        break;
      case '-':
        newResult = num1 - num2;
        break;
      case '×':
        newResult = num1 * num2;
        break;
      case '÷':
        newResult = num2 != 0 ? num1 / num2 : double.infinity;
        break;
    }

    if (newResult != _result) {
      _result = newResult;
      notifyListeners();
    }
  }
}
