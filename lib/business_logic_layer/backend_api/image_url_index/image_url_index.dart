import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';

class ImageURLIndex extends ChangeNotifier {
  String imageUrl = '';
  String name = '';
  int indexNumber = 0;

  ///call this method to change the [imageUrl], [name] and [indexNumber] properties state
  ///need to change the state of these values for the use in [FullScreen] class
  ///for easy Download and easy Wallpaper Setting
  void changeImageURLIndexProperties(String url, String imageName, int index) {
    imageUrl = url;
    name = imageName;
    indexNumber = index;
    notifyListeners();
  }
}
