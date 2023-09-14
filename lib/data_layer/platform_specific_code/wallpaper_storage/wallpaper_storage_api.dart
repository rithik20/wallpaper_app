import 'package:flutter/services.dart';

class WallpaperStorageAPI {
  static const wallpaperStorage = MethodChannel("wallpaper");

  Future<void> storeWallpaper(String imageUrl, String imageName) async {
    try {
      await wallpaperStorage.invokeMethod("store_wallpaper_to_gallery", {
        "imageUrl" : imageUrl,
        "imageName" : imageName,
      });
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }
}
