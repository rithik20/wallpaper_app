import 'package:flutter/material.dart';

class SearchImagePageCounter extends ChangeNotifier{

  int pageNumber = 1;

  void increasePageNumber(){
    pageNumber++;
    notifyListeners();
  }

  void resetPageNumber(){
    pageNumber = 1;
    notifyListeners();
  }
}