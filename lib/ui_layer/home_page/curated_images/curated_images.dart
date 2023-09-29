import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/image_details/image_list_index.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import '../../../riverpod/providers/riverpod_providers.dart';
import '../../../riverpod/state_notifier_providers/image_details/image_details.dart';

class CuratedImages extends ConsumerWidget {
  const CuratedImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curatedImages = ref.watch(curatedImagesApi);
    final scrollController = ref.watch(scrollControllers);
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
                      itemCount: data.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              ///if the user tapped any image then show it in fullScreen
                              ///pass the data from the StreamBuilder to the
                              ///changeImageDetailsProperties()in the ImageProviderToUser,
                              ///class and index from the GridView.builder to the
                              ///changeIndexImageListIndex() method in the
                              ///ImageListIndex class
                              ref
                                  .read(imageProviderToUser.notifier)
                                  .changeImageDetailsProperties(data.data!);
                              ref
                                  .read(imageListIndex.notifier)
                                  .changeIndexImageListIndex(index);

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
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
