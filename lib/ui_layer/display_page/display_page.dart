import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/display_page/get_more_images.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/search_image/search_image_page_count.dart';
import '../../business_logic_layer/text_controllers_provider/text_controllers.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {

    final textControllers = Provider.of<TextControllers>(context);

    final searchImagePageCounter = Provider.of<SearchImagePageCounter>(context);

    return Scaffold(
      appBar: AppBar(
        ///getting the Search term from searchImage TextController from TextControllers dependency here
        title: Text(textControllers.searchImage.value.text.toUpperCase()),
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  ///need to clear the searchImage TextEditingController value
                  ///and also reset the PageNumber to default value
                  textControllers.searchImage.clear();
                  searchImagePageCounter.resetPageNumber();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: const DisplayImageBody(),
      floatingActionButton: const GetMoreImages(),
    );
  }
}
