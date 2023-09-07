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

    return FloatingActionButton(
        onPressed: () async{
          searchImagePageCounter.increasePageNumber();
          await images.getMoreImagesFromTheQuery(textControllers.searchImage.value.text, searchImagePageCounter.pageNumber);
        },
      child: const Icon(CupertinoIcons.down_arrow),
    );
  }
}
