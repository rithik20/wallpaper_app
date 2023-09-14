import 'package:flutter/services.dart';
import 'package:free_wallpaper/business_logic_layer/download_image_to_downloads/download_images_to_downloads.dart';

class WallpaperDownloadToast {

  ///if the [DownloadImage] logic class's isDownloaded is true then call this method
  static const downloadToast = MethodChannel("wallpaper");

  Future<void> showWallpaperDownloadToast() async {
    try {
      await downloadToast.invokeMethod("show_downloaded_toast");
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }
}
