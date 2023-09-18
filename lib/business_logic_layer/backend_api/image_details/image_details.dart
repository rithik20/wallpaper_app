import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';

class ImageProviderClass extends ChangeNotifier {
  List<Map<String, dynamic>> imageList = [];
  int indexNumber = 0;

  ///call this method to change the [imageList], [indexNumber] properties state,
  ///need to change the state of these values for the use in [FullScreen] class
  ///for easy Download and easy Wallpaper Setting
  void changeImageDetailsProperties( List<Map<String, dynamic>> list, int index) {
    imageList = list;
    indexNumber = index;
    notifyListeners();
  }

  ///call this method for Swipe left functionality
  ///this method is used in the [FullScreen] Widget class
  void swipeLeft(int index){
    indexNumber = index;
    notifyListeners();
  }

  ///call this method for Swipe right functionality
  ///this method is used in the [FullScreen] Widget class
  void swipeRight(int index){
    indexNumber = index;
    notifyListeners();
  }
}
