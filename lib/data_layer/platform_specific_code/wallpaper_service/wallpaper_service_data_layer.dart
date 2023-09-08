import 'package:flutter/services.dart';

class WallpaperService{

  static const platform = MethodChannel("wallpaper");

  Future<void> getWallpaperService() async{

    try {
      final wallpaper = platform.invokeMethod("change_wallpaper");
    }on PlatformException catch(e){
      throw e.toString();
    }
  }
}