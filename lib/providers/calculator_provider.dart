import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  double? _result;

  double? get result => _result;

  void calculate(String operation, String input1, String input2) {
    final num1 = double.tryParse(input1);
    final num2 = double.tryParse(input2);

    if (num1 == null || num2 == null) {
      _result = null;
      notifyListeners();
      return;
    }

    switch (operation) {
      case '+':
        _result = num1 + num2;
        break;
      case '-':
        _result = num1 - num2;
        break;
      case '×':
        _result = num1 * num2;
        break;
      case '÷':
        _result = num2 != 0 ? num1 / num2 : double.infinity;
        break;
    }
    notifyListeners();
  }
}
