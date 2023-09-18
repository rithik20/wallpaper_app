import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';

class IndexNumberState extends ChangeNotifier{

  int index = 0;

  ///call this [changeIndex] method to change the [index] variable value
  ///the [BottomNavigation] class is perform will use this method to change
  ///the currentIndex parameter value with this [index] value
  void changeIndex(int indexNumber){
    index = indexNumber;
    notifyListeners();
  }
}

