import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import '../../../../data_layer/backend_api/search_image/search_image_api.dart';

@immutable
class ImageUrlList{

  final List<Map<String, dynamic>> imageList;

  const ImageUrlList({required this.imageList});

  ImageUrlList clone(List<Map<String, dynamic>> image){
    return ImageUrlList(imageList: image);
  }
}
class SearchedImageProvider extends StateNotifier<ImageUrlList>{
  SearchedImageProvider() : super(const ImageUrlList(imageList: []));
  //this is the list that holds the images, that the user searched
  List<Map<String, dynamic>> searchedImageList = [];

  ///need the [searchedImages] DataProvider in the [SearchImageApiData] class
  final SearchImageApiData searchImageApiData = SearchImageApiData();

  ///this business logic is for getting the images from the server using the
  ///query that the user entered. This method is called in the
  ///[HomePageBody] class.
  Future<void> getImagesFromSearchImageApiData(String query) async {
    ///change the state of searchedImageList, using the new list
    ///returned by the searchedImages() method in the SearchImageApiData class
    ///
    searchedImageList = await searchImageApiData.searchedImages(query);

    if (searchedImageList.isNotEmpty) {
      state = state.clone(searchedImageList);
    }
  }

  ///this business logic is for getting more images from the server using the
  ///query that the user already entered. This method is called in the
  ///[DisplayImageBody] class.
  Future<void> getMoreImagesFromTheQuery(String query, int pageNUmber) async {
    searchedImageList +=
        await searchImageApiData.getMoreImages(query, pageNUmber);
    state = state.clone(searchedImageList);
  }
}

final searchedImagesListProvider = StateNotifierProvider<SearchedImageProvider, ImageUrlList>((ref) => SearchedImageProvider());
