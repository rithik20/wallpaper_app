import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/app_style_provider/style.dart';
import '../../business_logic_layer/backend_api/search_image/search_image_logic.dart';
import '../../business_logic_layer/text_controllers_provider/text_controllers.dart';
import '../display_page/display_page.dart';
import '../display_page/no_data_to_show.dart';
import 'curated_images/curated_images.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textControllers = Provider.of<TextControllers>(context);

    final searchedImageProvider = Provider.of<SearchedImageProvider>(context);

    final style = Provider.of<Style>(context);

    return Container(
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        ///Text Field for searching the images from the server
        TextFormField(
          controller: textControllers.searchImageQuery,
          cursorColor: style.appBarTitleColor,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Type here to Search",
              suffixIcon: IconButton(
                  onPressed: () async {
                    ///if the TextFormField is empty then show a SnackBar
                    ///the TextFormFiled has a controller named searchImageQuery
                    ///check if the searchImageQuery has a value or not!
                    if (textControllers.searchImageQuery.value.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("Please Enter Query To Search"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    //if the searchImageQuery is not empty then call the API
                    else {
                      ///call the getImagesFromSearchImageApiData() method in the
                      ///[SearchedImageProvider] class to search for the results
                      await searchedImageProvider
                          .getImagesFromSearchImageApiData(
                              textControllers.searchImageQuery.value.text);

                      if (!context.mounted) return;

                      ///the [SearchedImageProvider] class has a searchedImageList
                      ///list it holds the images url after the working of
                      ///getImagesFromSearchImageApiData() method in the
                      ///[SearchedImageProvider] class.
                      if (searchedImageProvider.searchedImageList.isNotEmpty) {
                        //Navigate to the DisplayImage Widget
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DisplayImage()));
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
                  },
                  icon: const Icon(
                    CupertinoIcons.search,
                    weight: 25.0,
                    size: 30.0,
                  )),
              suffixIconColor: style.searchButtonColor,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              focusColor: Colors.black),
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
