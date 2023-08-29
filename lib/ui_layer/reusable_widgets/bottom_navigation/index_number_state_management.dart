import 'package:flutter/material.dart';

class IndexNumber extends ChangeNotifier{

  int index = 0;

  void changeIndex(int indexNumber){
    index = indexNumber;
    notifyListeners();
  }
}