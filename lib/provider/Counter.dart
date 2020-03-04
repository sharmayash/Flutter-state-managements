import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counterVal {
    return _counter;
  }

  void increment() {
    _counter += 1;
    notifyListeners();
  }

  void decrement() {
    _counter -= 1;
    notifyListeners();
  }
}
