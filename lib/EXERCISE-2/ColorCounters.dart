import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void incrementRed() {
    redTapCount++;
    notifyListeners();
  }

  void incrementBlue() {
    blueTapCount++;
    notifyListeners();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
