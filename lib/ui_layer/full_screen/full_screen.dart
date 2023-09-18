import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:free_wallpaper/business_logic_layer/download_image_to_downloads/download_images_to_downloads.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/backend_api/image_details/image_details.dart';
import '../../business_logic_layer/platform_specific_code/wallpaper_change_service/set_wallpaper.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeWallpaper = Provider.of<ChangeWallpaper>(context);
    final fileDownloader = Provider.of<DownloadImage>(context);
    final imageProvider = Provider.of<ImageProviderClass>(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onHorizontalDragUpdate: (swipe) {
            //this GestureDetector is used to add swipe functionality to the
            if (swipe.delta.dx < 0) {
              imageProvider.swipeLeft(imageProvider.indexNumber + 1);
            } else if (swipe.delta.dx > 0) {
              imageProvider.swipeRight(imageProvider.indexNumber - 1);
            }
          },
          child: Consumer<ImageProviderClass>(builder: (context, image, child) {
            return Image(
              ///showing the image in the network using the imageList
              ///from the ImageProviderClass
              image: NetworkImageWithRetry(imageProvider
                  .imageList[imageProvider.indexNumber]['src']['large2x']),
              fit: BoxFit.contain,
            );
          }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///Image Download Button
          FloatingActionButton(
            backgroundColor: Colors.white12,
            onPressed: () async {
              ///when pressed this button then the user request that image to download
              ///pass the image url, and the image name to the downloadTheImage()
              ///method in the DownloadImage class
              await fileDownloader.downloadTheImage(
                  imageProvider.imageList[imageProvider.indexNumber]['src']
                      ['large2x'],
                  imageProvider.imageList[imageProvider.indexNumber]['alt']);
            },
            child: const Icon(
              CupertinoIcons.down_arrow,
              color: Colors.white,
            ),
          ),

          ///Wallpaper Set Button
          MaterialButton(
            textColor: Colors.white,
            color: Colors.white12,
            height: 55.0,
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            onPressed: () async {
              ///this is for user's, to set the image us their Wallpaper
              ///call the setNewWallpaperWithImage() method in the [ChangeWallpaper]
              /// class, to change the Wallpaper of the User's device
              await changeWallpaper.setNewWallpaperWithImage(imageProvider
                  .imageList[imageProvider.indexNumber]['src']['large2x']);
            },
            child: const Text(
              "Set as Wallpaper",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
