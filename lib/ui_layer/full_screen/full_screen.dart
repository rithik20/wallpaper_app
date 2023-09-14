import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/image_url_index/image_url_index.dart';
import 'package:free_wallpaper/business_logic_layer/download_image_to_downloads/download_images_to_downloads.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/platform_specific_code/wallpaper_change_service/set_wallpaper.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeWallpaper = Provider.of<ChangeWallpaper>(context);
    final fileDownloader = Provider.of<DownloadImage>(context);
    final imageURLIndex = Provider.of<ImageURLIndex>(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          imageURLIndex.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await fileDownloader.downloadTheImage(
                  imageURLIndex.imageUrl, imageURLIndex.name);
            },
            child: const Icon(CupertinoIcons.down_arrow),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            height: 55.0,
            decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: MaterialButton(
              textColor: Colors.white,
              onPressed: () async {
                ///this is for user's, to set the image us their Wallpaper
                ///call the setNewWallpaperWithImage() method in the [ChangeWallpaper]
                /// class, to change the Wallpaper of the User's device
                await changeWallpaper
                    .setNewWallpaperWithImage(imageURLIndex.imageUrl);
              },
              child: const Text(
                "Set as Wallpaper",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
