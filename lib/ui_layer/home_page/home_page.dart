import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/sample_images/sample_images.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Type here to Search",
                suffixIcon: IconButton(
                    onPressed: () {
                      ///navigate to the DisplayImage widget to show the images
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const DisplayImage()));
                    },
                    icon: const Icon(
                      CupertinoIcons.search,
                      weight: 25.0,
                      size: 30.0,
                    )),
                suffixIconColor: Provider.of<Style>(context).searchButtonColor,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                focusColor: Colors.black
              ),
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
