import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/image_details/image_list_index.dart';
import '../../riverpod/providers/riverpod_providers.dart';
import '../../riverpod/state_notifier_providers/image_details/image_details.dart';

class FullScreen extends ConsumerWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeWallpaper = ref.watch(setWallpaperProvider);
    final fileDownloader = ref.watch(downloadImageProvider);
    final imageProvider = ref.watch(imageProviderToUser);
    final imageIndex = ref.watch(imageListIndex);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onHorizontalDragUpdate: (swipe) {
            //this GestureDetector is used to add swipe functionality to the
            if (swipe.delta.dx < 0) {
              ref.read(imageListIndex.notifier).swipeLeft(imageIndex.index + 1);
            } else if (swipe.delta.dx > 0) {
              ref.read(imageListIndex.notifier).swipeRight(imageIndex.index - 1);
            }
          },
          child: CachedNetworkImage(
              ///showing the image in the network using the imageList
              ///from the ImageProviderClass
              imageUrl: imageProvider
                  .imageList[imageIndex.index]['src']['large2x'],
              fit: BoxFit.contain,
            ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///Image Download Button
          FloatingActionButton(
            backgroundColor: Colors.white12,
            shape: const CircleBorder(
              eccentricity: 1.0
            ),
            onPressed: () async {
              ///when pressed this button then the user request that image to download
              ///pass the image url, and the image name to the downloadTheImage()
              ///method in the DownloadImage class
              await fileDownloader.downloadTheImage(
                  imageProvider.imageList[imageIndex.index]['src']
                      ['large2x'],
                  imageProvider.imageList[imageIndex.index]['alt']);
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
                  .imageList[imageIndex.index]['src']['large2x']);
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
