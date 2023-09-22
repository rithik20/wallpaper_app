import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';

class SearchImagePageCounter{

  int initialPageNumber = 1;

  ///this [increasePageNumber] method responsible for increasing the [pageNumber]
  ///by 1.
  ///the [pageNumber] variable is used in the [DisplayImageBody] class.
  void increasePageNumber() {
    initialPageNumber += 1;
  }

  ///this method reset the [pageNumber] to 1.
  void resetPageNumber() {
    initialPageNumber = 1;
  }
}

final searchImagePageCounterClass = StateProvider((ref) => SearchImagePageCounter());
