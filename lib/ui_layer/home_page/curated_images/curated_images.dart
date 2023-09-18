import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import 'package:provider/provider.dart';
import '../../../business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import '../../../business_logic_layer/backend_api/curated_images/curated_images_page_count.dart';
import '../../../business_logic_layer/backend_api/image_details/image_details.dart';
import '../../../business_logic_layer/controllers/scroll_controllers/scroll_controllers.dart';

class CuratedImages extends StatelessWidget {
  const CuratedImages({super.key});

  @override
  Widget build(BuildContext context) {
    final imageDetails = Provider.of<ImageProviderClass>(context);
    final curatedImages = Provider.of<CuratedImagesAPI>(context);
    final curatedImagesPageCounter =
        Provider.of<CuratedImagePageCounter>(context);
    final scrollController = Provider.of<ScrollControllers>(context);
    return Column(
      children: [
        Expanded(child:
            Consumer<CuratedImagesAPI>(builder: (context, curatedImage, child) {
          return GridView.builder(
              controller: scrollController.curatedImageScrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),

              ///here we using the curatedList list to show the images in
              ///GridView it is a late Data Structure initialized in the file
              ///free_wallpaper/business_logic_layer/curated_images/curated_images_logic.dart
              itemCount: curatedList.length + 1,
              itemBuilder: (context, indexNumber) {
                if (indexNumber < curatedList.length) {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        ///if the user tapped any image then show it in fullScreen
                        ///pass the curatedList, and index to the
                        ///changeImageDetailsProperties() method in the
                        ///ImageProviderClass
                        imageDetails.changeImageDetailsProperties(
                            curatedList, indexNumber);

                        ///then navigate to the FullScreen Widget
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FullScreen()));
                      },

                      ///show the images from the network
                      child: Image(
                        image: NetworkImageWithRetry(
                            curatedList[indexNumber]['src']['large']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  ///if the user reached at the end then call the
                  /// getMoreCuratedImagesFromDataProvider() method in the
                  /// CuratedImagesAPI class
                  scrollController.curatedImageScrollController
                      .addListener(() async {
                    if (scrollController.curatedImageScrollController.position
                            .maxScrollExtent ==
                        scrollController.curatedImageScrollController.offset) {
                      curatedImagesPageCounter.increasePageNumber();

                      await curatedImages.getMoreCuratedImagesFromDataProvider(
                          curatedImagesPageCounter.pageNumber);
                    }
                  });
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ));
                }
              });
        }))
      ],
    );
  }
}
