import 'package:permission_handler/permission_handler.dart';

late PermissionStatus storageStatusCheck;

class StoragePermission {
  PermissionStatus storageStatus = storageStatusCheck;

  ///this method is for asking the user for Storage Permission
  ///using the [Permission] class
  Future<void> getStoragePermission() async {
    //await the status for Storage API
    storageStatus = await Permission.storage.status;

    if (storageStatus == PermissionStatus.denied) {
      //if it's not Granted ask the Storage Permission to user
      await Permission.storage.request();
    } else if (storageStatus == PermissionStatus.permanentlyDenied) {
      await openSettings();
    } else {
      storageStatus = PermissionStatus.granted;
    }
  }

  Future<bool> openSettings() async {
    return await openAppSettings();
  }
}
