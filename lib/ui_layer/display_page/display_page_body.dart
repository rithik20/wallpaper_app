import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/backend_api/image_url_index/image_url_index.dart';
import '../../business_logic_layer/backend_api/search_image/search_image_logic.dart';
import '../full_screen/full_screen.dart';

class DisplayImageBody extends StatelessWidget {
  const DisplayImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final imageURLIndex = Provider.of<ImageURLIndex>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            ///listing all images from the server in grid view mode here
            child: Consumer<SearchedImageProvider>(
                builder: (context, image, child) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  ///the [SearchedImageProvider] class has a searchedImageList list
                  ///this list holds all the images returned by the Data Layer
                  itemCount: image.searchedImageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          ///if the user tapped any image then show it in fullScreen
                          ///pass the image's url, image Name, and index from the searchedImageList
                          ///to the changeImageURLIndexProperties() method in the
                          ///ImageURLIndex class
                          imageURLIndex.changeImageURLIndexProperties(image.searchedImageList[index]
                          ['src']['large2x'],image.searchedImageList[index]['alt'], index);
                          ///then navigate to the FullScreen Widget
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FullScreen()));
                        },
                        child: Image.network(
                          image.searchedImageList[index]['src']['medium'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
