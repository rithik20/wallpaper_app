import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/display_page/no_data_to_show.dart';
import '../../riverpod/providers/network_status/network_information.dart';
import '../../riverpod/providers/riverpod_providers.dart';
import '../../riverpod/state_notifier_providers/app_style_provider/style.dart';
import '../../riverpod/state_notifier_providers/search_image_api/search_image/search_image_logic.dart';
import 'curated_images/curated_images.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(textControllers);

    final searchedImageProvider = ref.watch(searchedImagesListProvider);

    final displayImageAnimation = ref.watch(displayImageNavigationAnimation);

    final styles = ref.watch(style);

    final connectivityState = ref.watch(networkCheckerProvider);

    return Container(
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        ///Image searching area
        SearchBar(
          controller: textController.searchImageQuery,
          hintText: "Type Here to Search",
          trailing: [
            IconButton(
                onPressed: () async {
                  await connectivityState.getNetworkState();

                  ///before navigate to the DisplayImage widget
                  ///first check if the device has a stable network connection
                  if (isDeviceHasConnection) {
                    ///if the TextFormField is empty then show a SnackBar
                    ///the TextFormFiled has a controller named searchImageQuery
                    ///check if the searchImageQuery has a value or not!
                    if (textController.searchImageQuery.value.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("Please Enter Query To Search"),
                        duration: Duration(seconds: 2),
                      );
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    //if the searchImageQuery is not empty then call the API
                    else {
                      ///call the getImagesFromSearchImageApiData() method in the
                      ///[SearchedImageProvider] class to search for the results
                      await ref
                          .read(searchedImagesListProvider.notifier)
                          .getImagesFromSearchImageApiData(
                              textController.searchImageQuery.value.text);

                      if (!context.mounted) return;

                      ///the [SearchedImageProvider] class has a searchedImageList
                      ///list it holds the images url after the working of
                      ///getImagesFromSearchImageApiData() method in the
                      ///[SearchedImageProvider] class.
                      if (searchedImageProvider.imageList.isNotEmpty) {
                        //Navigate to the DisplayImage Widget
                        Navigator.of(context).push(displayImageAnimation
                            .displayImageRouteAnimation(context));
                      } else {
                        ///if the searchedImageList is empty then, it means
                        ///there is no data returned from the backend. So,
                        ///Navigate to the NoDataToShow Widget to alert the user
                        ///there is no data to show! as per the user requested query
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NoDataToShow()));
                      }
                    }
                  } else {
                    ///if the device lost connection before navigate to the
                    ///DisplayImage widget show a snackBar
                    const snackBar = SnackBar(
                      content: Text("No Internet Connection"),
                      duration: Duration(seconds: 2),
                    );
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                visualDensity: VisualDensity.adaptivePlatformDensity,
                icon: Icon(
                  CupertinoIcons.search,
                  weight: 25.0,
                  size: 30.0,
                  color: styles.searchButtonColor,
                ))
          ],
        ),

        const SizedBox(
          height: 10.0,
        ),

        ///Showing sample images in a row form
        const Expanded(child: CuratedImages()),
      ]),
    );
  }
}
