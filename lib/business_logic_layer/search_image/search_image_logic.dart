import 'package:flutter/material.dart';
import 'package:free_wallpaper/data_layer/display_image/search_image_api.dart';

class SearchedImageProvider extends ChangeNotifier{

  //this is the list that holds the images, that the user searched
  List<Map<String, dynamic>> searchedImageList = [];

  //need the searchedImages() DataProvider in the SearchImageApiData class
  final SearchImageApiData searchImageApiData = SearchImageApiData();

  Future<void> getImagesFromSearchImageApiData(String query) async{

    ///change the state of searchedImageList, using the new list
    ///returned by the searchedImages() method in the SearchImageApiData class
    ///
    searchedImageList = await searchImageApiData.searchedImages(query);

    if(searchedImageList.isNotEmpty){
      notifyListeners();
    }
  }

  Future<void> getMoreImagesFromTheQuery(String query, int pageNUmber) async{

    searchedImageList += await searchImageApiData.getMoreImages(query, pageNUmber);
    notifyListeners();
  }
}