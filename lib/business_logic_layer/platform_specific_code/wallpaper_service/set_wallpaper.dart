import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_wallpaper/data_layer/platform_specific_code/wallpaper_service/wallpaper_service_data_layer.dart';

class ChangeWallpaper extends ChangeNotifier{

  ///this variable holds the state of wallpaper activity,
  ///if the value is false, which means the wallpaper doesn't changed
  bool isWallpaperChanged = false;

  final WallpaperService wallpaperService = WallpaperService();

  Future<void> setNewWallpaperWithImage(String imageUrl) async{

    try {
      ///if the setNewWallpaperWithURLImage() method in the WallpaperService class
      ///successfully worked it will returns true, and change the state of
      ///isWallpaperChanged with that value.
      isWallpaperChanged = await wallpaperService.setNewWallpaperWithURLImage(imageUrl);
    }on PlatformException catch(e){
      ///if the setNewWallpaperWithURLImage() method in the WallpaperService class
      ///is not worked, then there is a PlatForm Exception and the method will return false,
      ///so, change the state of isWallpaperChanged with that value.
      isWallpaperChanged = false;
      throw e.toString();
    }
  }
}