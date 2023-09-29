import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data_layer/backend_api/curated_photos/curated_photos_data.dart';

@immutable
class CuratedImagesList{

  final List<Map<String, dynamic>> curatedImageList;

  const CuratedImagesList({required this.curatedImageList});

  CuratedImagesList clone(List<Map<String, dynamic>> image){
    return CuratedImagesList(curatedImageList: image);
  }
}

class CuratedImagesAPI extends StateNotifier<CuratedImagesList>{
  CuratedImagesAPI() : super(const CuratedImagesList(curatedImageList: []));

  //this is the list that holds the images, that the user searched
  List<Map<String, dynamic>> curatedList = [];

  ///need the [CuratedPhotos] class to work with Curated API from backend
  final CuratedPhotos curatedPhotos = CuratedPhotos();

  ///The backend Api is adding new photos in every hour so use [Stream] here
  ///this will return a List in every one hour
  Stream<List<Map<String, dynamic>>> getCuratedPhotos() async* {
    while (true) {
      ///the getCuratedPhotos() in the CuratedPhotos class return's
      ///the CuratedImages List
      curatedList = await curatedPhotos.getCuratedPhotos();
      yield curatedList;
      await Future.delayed(const Duration(hours: 1));
    }
  }
}
