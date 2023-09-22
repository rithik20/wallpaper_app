import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import '../../riverpod/providers/riverpod_providers.dart';
import '../../riverpod/state_notifier_providers/image_details/image_details.dart';
import '../../riverpod/state_notifier_providers/image_details/image_list_index.dart';
import '../../riverpod/state_notifier_providers/search_image_api/search_image/search_image_logic.dart';
import '../../riverpod/state_notifier_providers/search_image_api/search_image/search_image_page_count.dart';

class DisplayImageBody extends ConsumerWidget {
  const DisplayImageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllers);
    final searchedImages = ref.watch(searchedImagesListProvider);
    final textController = ref.watch(textControllers);
    final searchImagePageCounter = ref.watch(searchImagePageCounterClass);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            ///listing all images from the server in grid view mode here
              child: GridView.builder(
                  controller: scrollController.searchImageScrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  ///the [SearchedImageProvider] class has a searchedImageList list
                  ///this list holds all the images returned by the Data Layer
                  itemCount: searchedImages.imageList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < searchedImages.imageList.length) {
                      return Container(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                            onTap: () {
                              ///if the user tapped any image then show it in fullScreen
                              ///pass the imageList to the changeImageDetailsProperties() method
                              ///in the ImageProviderToUser class, and index to the
                              ///changeIndexImageListIndex() method in the
                              ///ImageListIndex
                              ref.read(imageProviderToUser.notifier).changeImageDetailsProperties(
                                  searchedImages.imageList);
                              ref.read(imageListIndex.notifier).changeIndexImageListIndex(index);

                              ///then navigate to the FullScreen Widget
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FullScreen()));
                            },
                            child: CachedNetworkImage(
                              imageUrl: searchedImages.imageList[index]['src']
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
                          await ref.read(searchedImagesListProvider.notifier).getMoreImagesFromTheQuery(
                              textController.searchImageQuery.value.text,
                              ref.read(searchImagePageCounterClass.notifier).state.initialPageNumber);
                        }
                      });
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      );
                    }
                  }),
          ),
        ],
      ),
    );
  }
}
