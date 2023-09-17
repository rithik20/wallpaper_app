import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/display_page/get_more_images.dart';
import 'package:free_wallpaper/ui_layer/display_page/no_data_to_show.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';

class TextControllers{

  ///this [searchImageQuery] used in these Widget classes
  ///[HomePageBody], [DisplayImage], [GetMoreImages], [NoDataToShow]
  TextEditingController searchImageQuery = TextEditingController();
}