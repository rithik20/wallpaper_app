import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/controllers/scroll_controllers/scroll_controllers.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/backend_api/image_details/image_details.dart';
import '../../business_logic_layer/backend_api/search_image/search_image_logic.dart';
import '../../business_logic_layer/backend_api/search_image/search_image_page_count.dart';
import '../../business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';

class DisplayImageBody extends StatelessWidget {
  const DisplayImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final imageDetails = Provider.of<ImageProviderClass>(context);
    final scrollController = Provider.of<ScrollControllers>(context);
    final getMoreImages = Provider.of<SearchedImageProvider>(context);
    final textControllers = Provider.of<TextControllers>(context);
    final searchImagePageCounter = Provider.of<SearchImagePageCounter>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            ///listing all images from the server in grid view mode here
            child: Consumer<SearchedImageProvider>(
                builder: (context, image, child) {
              return GridView.builder(
                  controller: scrollController.searchImageScrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  ///the [SearchedImageProvider] class has a searchedImageList list
                  ///this list holds all the images returned by the Data Layer
                  itemCount: image.searchedImageList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < image.searchedImageList.length) {
                      return Container(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                            onTap: () {
                              ///if the user tapped any image then show it in fullScreen
                              ///pass the searchedImageList, and index to the
                              ///changeImageDetailsProperties() method in the
                              ///ImageProviderClass
                              imageDetails.changeImageDetailsProperties(
                                  image.searchedImageList, index);

                              ///then navigate to the FullScreen Widget
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FullScreen()));
                            },
                            child: CachedNetworkImage(
                              imageUrl: image.searchedImageList[index]['src']
                                  ['large'],
                              fit: BoxFit.cover,
                            )),
                      );
                    } else {
                      ///if the user reached at the end of the list then automatically
                      ///call the getMoreImagesFromTheQuery() method from the
                      ///SearchImageProvider class
                      scrollController.searchImageScrollController
                          .addListener(() async {
                        if (scrollController.searchImageScrollController
                                .position.maxScrollExtent ==
                            scrollController
                                .searchImageScrollController.offset) {
                          ///call the increasePageNumber() method in the [SearchImagePageCounter]
                          ///class to increase the pageNumber by 1.
                          searchImagePageCounter.increasePageNumber();

                          ///then pass the pageNumber to the getMoreImagesFromTheQuery() method
                          ///be with the searchImageQuery TextEditingController's value.
                          await getMoreImages.getMoreImagesFromTheQuery(
                              textControllers.searchImageQuery.value.text,
                              searchImagePageCounter.pageNumber);
                        }
                      });
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      );
                    }
                  });
            }),
          ),
        ],
      ),
    );
  }
}
