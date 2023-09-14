import 'package:permission_handler/permission_handler.dart';

class StoragePermission {

  bool isStoragePermissionGranted = false;

  ///this method is for asking the user for Storage Permission
  ///using the [Permission] class
  Future<bool> getStoragePermission() async {

    //await the status for Storage API
    PermissionStatus storageStatus = await Permission.storage.status;

    //if it's already Granted then assign true to isStoragePermissionGranted variable
    if(storageStatus.isGranted){
      isStoragePermissionGranted = true;
    }else{
      //if it's not Granted ask the Storage Permission to user
      var status = await Permission.storage.request();
      if(status.isGranted){
        isStoragePermissionGranted = true;
      }else{
        isStoragePermissionGranted = false;
      }
    }

    //return the result here
    return isStoragePermissionGranted;
  }
}