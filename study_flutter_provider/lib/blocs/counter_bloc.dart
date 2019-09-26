import 'package:flutter/material.dart';

class CnCounter with ChangeNotifier {
  int _counter1 = 0;
  int _counter2 = 0;
  int get counter1 => _counter1;
  int get counter2 => _counter2;

  void increment1() {
    _counter1++;
    notifyListeners();
  }

  void increment2() {
    _counter2++;
    notifyListeners();
  }
}
