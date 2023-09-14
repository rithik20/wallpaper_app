import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import '../../../business_logic_layer/backend_api/image_url_index/image_url_index.dart';
import '../../full_screen/full_screen.dart';

class CuratedImages extends StatelessWidget {
  const CuratedImages({super.key});

  @override
  Widget build(BuildContext context) {
    final imageURLIndex = Provider.of<ImageURLIndex>(context);
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
                        ///pass the image's url, image Name, and index from the curatedList
                        ///to the changeImageURLIndexProperties() method in the
                        ///ImageURLIndex class
                        imageURLIndex.changeImageURLIndexProperties(
                            curatedList[indexNumber]['src']['large2x'],
                            curatedList[indexNumber]['alt'],
                            indexNumber);
                        ///then navigate to the FullScreen Widget
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FullScreen()));
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
