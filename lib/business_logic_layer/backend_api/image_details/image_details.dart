import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';

class ImageDetails extends ChangeNotifier {
  String imageUrl = '';
  String name = '';
  String photographerName = '';

  ///call this method to change the [imageUrl], [name] properties state
  ///need to change the state of these values for the use in [FullScreen] class
  ///for easy Download and easy Wallpaper Setting
  void changeImageDetailsProperties(String url, String imageName, String photographer) {
    imageUrl = url;
    name = imageName;
    photographerName = photographer;
    notifyListeners();
  }
}
