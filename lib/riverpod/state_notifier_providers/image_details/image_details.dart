import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';

@immutable
class ImageProviderClass{

  final List<Map<String, dynamic>> imageList;

  const ImageProviderClass({required this.imageList});

  ImageProviderClass clone(List<Map<String, dynamic>> image){

    return ImageProviderClass(imageList: image);
  }
}

class UpdateImageProviderClass extends StateNotifier<ImageProviderClass>{
  UpdateImageProviderClass() : super(const ImageProviderClass(imageList: []));

  ///call this method to change the [ImageProviderClass] state,
  ///need to change the state of the value for the use in [FullScreen] class
  ///for easy Download and easy Wallpaper Setting
  void changeImageDetailsProperties( List<Map<String, dynamic>> list) {
    state = state.clone(list);
  }
}

final imageProviderToUser = StateNotifierProvider<UpdateImageProviderClass, ImageProviderClass>((ref) => UpdateImageProviderClass());
