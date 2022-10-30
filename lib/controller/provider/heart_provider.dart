import 'package:flutter/material.dart';

class HeartProvider with ChangeNotifier {
  bool _isFav = false;

  bool get isFav => _isFav;

  set isFav(bool value) {
    _isFav = value;
    notifyListeners();
  }
}