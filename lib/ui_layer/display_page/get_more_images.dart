import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_page_count.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/search_image/search_image_logic.dart';
import '../../business_logic_layer/text_controllers_provider/text_controllers.dart';

class GetMoreImages extends StatelessWidget {
  const GetMoreImages({super.key});

  @override
  Widget build(BuildContext context) {

    final searchImagePageCounter = Provider.of<SearchImagePageCounter>(context);
    //declaring all Provider instances for this Widget here
    final images = Provider.of<SearchedImageProvider>(context);

    final textControllers = Provider.of<TextControllers>(context);

    ///whenever the user is pressed this FloatingActionButton then new images
    ///will be added to the searchedImageList list in the [SearchedImageProvider] class
    return FloatingActionButton(
        onPressed: () async{
          ///call the increasePageNumber() method in the [SearchImagePageCounter]
          ///class to increase the pageNumber by 1.
          searchImagePageCounter.increasePageNumber();

          ///then pass the pageNumber to the getMoreImagesFromTheQuery() method
          ///be with the searchImageQuery TextEditingController's value.
          await images.getMoreImagesFromTheQuery(textControllers.searchImageQuery.value.text, searchImagePageCounter.pageNumber);
        },
      child: const Icon(CupertinoIcons.down_arrow),
    );
  }
}
