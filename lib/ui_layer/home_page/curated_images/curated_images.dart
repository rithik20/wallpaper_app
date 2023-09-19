import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import 'package:provider/provider.dart';
import '../../../business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import '../../../business_logic_layer/backend_api/image_details/image_details.dart';
import '../../../business_logic_layer/controllers/scroll_controllers/scroll_controllers.dart';

class CuratedImages extends StatelessWidget {
  const CuratedImages({super.key});

  @override
  Widget build(BuildContext context) {
    final imageDetails = Provider.of<ImageProviderClass>(context);
    final curatedImages = Provider.of<CuratedImagesAPI>(context);
    final scrollController = Provider.of<ScrollControllers>(context);
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: curatedImages.getCuratedPhotos(),
              builder: (context, data) {
                if (data.hasData) {
                  return GridView.builder(
                      controller: scrollController.curatedImageScrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: data.data!.length + 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              ///if the user tapped any image then show it in fullScreen
                              ///pass the data from the StreamBuilder, and index from
                              ///the GridView.builder to the
                              ///changeImageDetailsProperties() method in the
                              ///ImageProviderClass
                              imageDetails.changeImageDetailsProperties(
                                  data.data!, index);

                              ///then navigate to the FullScreen Widget
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FullScreen()));
                            },

                            ///show the images from the network
                            child: CachedNetworkImage(
                              imageUrl: data.data?[index]['src']['large'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                } else if (data.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    ///if the device is in darkTheme show the
                    ///CircularProgressIndicator in white color, otherwise
                    ///black
                    color: darkThemeKeyValue ? Colors.white : Colors.black,
                  ));
                } else {
                  return const Center(
                    child: Text("NetWork Issue detected"),
                  );
                }
              }),
        ),
      ],
    );
  }
}
