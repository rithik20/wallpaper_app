import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/sample_images/sample_images.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../business_logic_layer/search_image/search_image_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textControllers = Provider.of<TextControllers>(context);

    final displayImage =
        Provider.of<SearchedImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Free Wallpapers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ///Text Field for searching the images from the server
            TextFormField(
              controller: textControllers.searchImage,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Type here to Search",
                  suffixIcon: IconButton(
                      onPressed: () async {
                        ///if the TextFormField is empty then show a SnackBar
                        if (textControllers.searchImage.value.text.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text("Please Enter Query To Search"),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        ///if the TextFormField is not empty then call the API
                        else {
                          await displayImage.getImagesFromSearchImageApiData(
                              textControllers.searchImage.value.text);

                          if (!context.mounted) return;
                          if (displayImage.searchedImageList.isNotEmpty) {
                            ///Navigate to the DisplayImage Widget
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DisplayImage()));
                          }
                        }
                      },
                      icon: const Icon(
                        CupertinoIcons.search,
                        weight: 25.0,
                        size: 30.0,
                      )),
                  suffixIconColor:
                      Provider.of<Style>(context).searchButtonColor,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  focusColor: Colors.black),
            ),

            ///Showing sample images in a row form
            const SampleImages(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
