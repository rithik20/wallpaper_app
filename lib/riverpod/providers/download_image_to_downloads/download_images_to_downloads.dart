import 'package:free_wallpaper/business_logic_layer/permission_handler/storage_permission.dart';
import 'package:free_wallpaper/data_layer/download_image/download_image.dart';
import 'package:permission_handler/permission_handler.dart';
import '../platform_specific_code/toast_widget_service/wallpaper_download_toast/wallpaper_download_toast.dart';

class DownloadImage {
  ///this [isImageDownloaded] variable holds the state that the image
  ///downloaded or not
  bool isImageDownloaded = false;

  ///need the [StoragePermission] class's dependency here to ask
  ///Storage Permission to user
  final StoragePermission storagePermission = StoragePermission();

  ///need the [DownloadImageToDownloads] class Data Provider dependency here
  ///to download the image and save it to the Downloads folder
  final DownloadImageToDownloads downloadImageToDownloads =
      DownloadImageToDownloads();

  ///need the [WallpaperDownloadToast] class to show a Toast to the user
  ///tells "Wallpaper Download Successfully"
  final WallpaperDownloadToast wallpaperDownloadToast =
      WallpaperDownloadToast();

  Future<void> downloadTheImage(String url, String name) async {
    ///first ask the Permission only run the remaining tasks if the Permission is Granted
    if (storagePermission.storageStatus != PermissionStatus.granted) {
      await storagePermission.getStoragePermission();
    } else if (storagePermission.storageStatus == PermissionStatus.granted) {
      try {
        isImageDownloaded =
            await downloadImageToDownloads.imageDownload(url, name);

        ///call the showWallpaperDownloadToast() method to alert the user
        ///that the image is Downloaded
        await wallpaperDownloadToast.showWallpaperDownloadToast();
      } catch (e) {
        isImageDownloaded = false;
        throw e.toString();
      }
    }
  }
}
