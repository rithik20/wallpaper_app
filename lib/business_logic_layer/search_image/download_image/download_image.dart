import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDownloader extends ChangeNotifier {
  final Dio dio = Dio();

  Future<void> downloadImage(String imageUrl) async {
    final permission = await Permission.storage.status;
    final getDirectory = await getApplicationDocumentsDirectory();

    if (permission.isGranted) {
      try {
        await dio.download(imageUrl, '${getDirectory.path}image.jpeg');
        print(getDirectory.path);
      } on DioException catch (e) {
        throw e.toString();
      }
    } else if(permission.isDenied || permission.isPermanentlyDenied || permission.isRestricted){
      final status = await Permission.storage.request();
      if (status.isGranted) {
        downloadImage(imageUrl);
      }
    }
  }
}
