import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increaseCount() {
    _counter++;
    notifyListeners();
  }

  void decreaseCount() {
    _counter--;
    notifyListeners();
  }


}