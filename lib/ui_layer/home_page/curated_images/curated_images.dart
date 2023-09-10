import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/curated_images/curated_images_logic.dart';
import '../../full_screen/full_screen.dart';

class CuratedImages extends StatelessWidget {
  const CuratedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                ///here we using the curatedList list to show the images in
                ///GridView it is a late Data Structure initialized in the file
                ///free_wallpaper/business_logic_layer/curated_images/curated_images_logic.dart
                itemCount: curatedList.length,
                itemBuilder: (context, indexNumber) {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        ///if the user tapped any image then show it in fullScreen
                        ///pass the image's url String from the curatedList
                        ///list to the FullScreen Widget
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullScreen(
                                    imageUrl: curatedList[indexNumber]['src']
                                        ['large2x'])));
                      },

                      ///show the images from the network
                      child: Image.network(
                        "${curatedList[indexNumber]['src']['medium']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
