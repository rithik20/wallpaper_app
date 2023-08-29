import 'package:flutter/material.dart';
import 'package:free_wallpaper/data_layer/display_image/search_image_api.dart';

class DisplaySearchImageProvider extends ChangeNotifier{

  List<Map<String, dynamic>> searchedImageList = [];

  final SearchImageApiData searchImageApiData = SearchImageApiData();

  Future<void> getImagesFromSearchImageApiData(String query) async{

    searchedImageList = await searchImageApiData.searchedImages(query);

    if(searchedImageList.isNotEmpty){
      notifyListeners();
    }
  }
}