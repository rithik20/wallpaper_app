import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/platform_specific_code/wallpaper_service/set_wallpaper.dart';
import 'package:provider/provider.dart';

class FullScreen extends StatelessWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final changeWallpaper = Provider.of<ChangeWallpaper>(context);

    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButton: Container(
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
            await changeWallpaper.setNewWallpaperWithImage(imageUrl);
          },
          child: const Text(
            "Set as Wallpaper",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
