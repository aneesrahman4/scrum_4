import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  // Changed 'with' to 'extends'
  Color _color = Colors.grey;

  Color get color => _color;

  void setRed() {
    _color = Colors.red;
    notifyListeners();
  }

  void setGreen() {
    _color = Colors.green;
    notifyListeners();
  }

  void reset() {
    _color = Colors.grey;
    notifyListeners();
  }
}
