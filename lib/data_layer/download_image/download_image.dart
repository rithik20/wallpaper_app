import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DownloadImageToDownloads {

  ///this method is responsible to download the image and save it
  ///to the Downloads Directory, here using the [flutter_file_downloader] package
  ///to download the file
  Future<bool> imageDownload(String url, String name) async {

    try {
      ///await the downloadFile() method provided by the flutter_file_downloader
      ///package to download the file and save it to the Downloads Directory
      await FileDownloader.downloadFile(
        url: url,
        name: name,
      );
      ///if the Download and save Works Correctly then return true
      return true;
    }on Exception{
      ///if any Exception then return false
      return false;
    }
  }
}
