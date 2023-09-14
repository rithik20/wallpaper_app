import 'package:flutter/services.dart';

class WallpaperService {
  static const platform = MethodChannel("wallpaper");

  Future<bool> setNewWallpaperWithURLImage(String imageUrl) async {
    //this variable holds the value returned by the Native side
    bool isWallpaperChanged = false;

    try {
      //here we passing an imageUrl Map argument to the Native code to work with it
      final bool result = await platform
          .invokeMethod("change_wallpaper", {"imageUrl": imageUrl});

      //change the state of the isWallpaperChanged to the value returned by the invokeMethod
      isWallpaperChanged = result;
    } on PlatformException catch (e) {
      //if any error occurs the state still holds the false value
      isWallpaperChanged = false;
      throw e.toString();
    }

    //return the boolean value here
    return isWallpaperChanged;
  }
}
