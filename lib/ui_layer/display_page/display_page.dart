import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/backend_api/search_image/search_image_page_count.dart';
import '../../business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {

    final textControllers = Provider.of<TextControllers>(context);

    final searchImagePageCounter = Provider.of<SearchImagePageCounter>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  ///need to clear the searchImage TextEditingController value
                  ///and also reset the PageNumber to default value
                  textControllers.searchImageQuery.clear();
                  searchImagePageCounter.resetPageNumber();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: const DisplayImageBody(),
    );
  }
}
