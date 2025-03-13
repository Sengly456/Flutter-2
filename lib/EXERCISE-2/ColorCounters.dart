import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier{
    int redTapCount=0;
    int blueTapcount=0;

    void incrementRed(){
      redTapCount++;
      notifyListeners();
    }
    void incrementblue(){
      blueTapcount++;
      notifyListeners();
    }
}