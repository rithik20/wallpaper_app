import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/search_image/search_image_logic.dart';
import '../full_screen/full_screen.dart';

class DisplayImageBody extends StatelessWidget {
  const DisplayImageBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                          ///pass the image's url String from the searchedImageList
                          ///list to FullScreen Widget
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                      imageUrl: image.searchedImageList[index]
                                          ['src']['large2x'])));
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
