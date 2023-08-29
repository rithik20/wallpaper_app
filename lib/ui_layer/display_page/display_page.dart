import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import 'package:provider/provider.dart';

import '../../business_logic_layer/display_image/display_search_image.dart';
import '../../business_logic_layer/text_controllers_provider/text_controllers.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    //declaring all Provider instances for this Widget here
    final images = Provider.of<DisplaySearchImageProvider>(context);

    final textControllers = Provider.of<TextControllers>(context);

    return Scaffold(
      appBar: AppBar(

        ///getting the Search term from searchImage TextController from TextControllers dependency here
        title: Text(textControllers.searchImage.value.text.toUpperCase()),
        centerTitle: true,
        leading: Builder(
            builder: (context) =>
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
      ),
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            Expanded(

              ///listing all images from the server in grid view mode here
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  ///the DisplaySearchImageProvider has a searchedImageList list
                  ///this list holds all the images returned by the Data Layer
                  itemCount: images.searchedImageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          ///if the user tapped any image then show it in fullScreen
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imageUrl: images.searchedImageList[index]['src']['large2x'])));
                        },
                        child: Image.network(
                          images.searchedImageList[index]['src']['medium'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
