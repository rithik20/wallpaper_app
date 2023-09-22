import 'package:flutter/services.dart';
import 'package:free_wallpaper/riverpod/providers/platform_specific_code/toast_widget_service/wallpaper_set_toast/toast_widget_service.dart';
import '../../../../data_layer/platform_specific_code/wallpaper_change/wallpaper_service_api.dart';

class ChangeWallpaper{

  ///this variable holds the state of wallpaper activity,
  ///if the value is false, which means the wallpaper doesn't changed
  bool isWallpaperChanged = false;

  //need the WallpaperService and ToastWidgetService dependencies here
  final WallpaperService wallpaperService = WallpaperService();

  final ToastWidgetService toastWidgetService = ToastWidgetService();

  Future<void> setNewWallpaperWithImage(String imageUrl) async{

    try {
      ///if the setNewWallpaperWithURLImage() method in the WallpaperService class
      ///successfully worked it will returns true, and change the state of
      ///isWallpaperChanged with that value.
      isWallpaperChanged = await wallpaperService.setNewWallpaperWithURLImage(imageUrl);
      ///if the Wallpaper changed Successfully then Show the success Toast
      if(isWallpaperChanged == true) {
        await toastWidgetService.getSuccessToastMessage();
      }
    }on PlatformException catch(e){
      ///if the setNewWallpaperWithURLImage() method in the WallpaperService class
      ///is not worked, then there is a PlatForm Exception and the method will return false,
      ///so, change the state of isWallpaperChanged with that value.
      isWallpaperChanged = false;
      await toastWidgetService.getUnSuccessToastMessage();
      throw e.toString();
    }
  }
}