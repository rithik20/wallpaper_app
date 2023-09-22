import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';
import 'package:free_wallpaper/ui_layer/home_page/curated_images/curated_images.dart';

@immutable
class ImageListIndex {
  final int index;

  const ImageListIndex({required this.index});

  ImageListIndex clone(int indexNUmber) {
    return ImageListIndex(index: indexNUmber);
  }
}

class UpdateImageListIndex extends StateNotifier<ImageListIndex> {
  UpdateImageListIndex() : super(const ImageListIndex(index: 0));

  ///call this method to change the state of [ImageListIndex] class
  ///this method is used in the [CuratedImages] and the [DisplayImageBody] widgets
  void changeIndexImageListIndex(int index) {
    state = state.clone(index);
  }

  ///call this method for Swipe left functionality
  ///this method is used in the [FullScreen] Widget class
  void swipeLeft(int index) {
    state = state.clone(index);
  }

  ///call this method for Swipe right functionality
  ///this method is used in the [FullScreen] Widget class
  void swipeRight(int index) {
    state = state.clone(index);
  }
}

final imageListIndex = StateNotifierProvider<UpdateImageListIndex, ImageListIndex>((ref) => UpdateImageListIndex());
