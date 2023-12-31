import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/home_page/curated_images/curated_images.dart';

class CuratedImagePageCounter{

  int pageNumber = 1;

  ///this [increasePageNumber] method responsible for increasing the [pageNumber]
  ///by 1.
  ///the [pageNumber] variable is used in the [CuratedImages] class.
  void increasePageNumber(){
    pageNumber++;
  }

  ///this method reset the [pageNumber] to 1.
  void resetPageNumber(){
    pageNumber = 1;
  }
}

final curatedImagesPageCounter = StateProvider((ref) => CuratedImagePageCounter());