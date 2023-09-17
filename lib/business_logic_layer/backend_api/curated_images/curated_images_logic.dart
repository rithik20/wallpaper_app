import 'package:flutter/material.dart';
import '../../../data_layer/backend_api/curated_photos/curated_photos_data.dart';

late List<Map<String, dynamic>> curatedList;

class CuratedImagesAPI extends ChangeNotifier{

  //need the CuratedPhotos class to work with Curated API from backend
  final CuratedPhotos curatedPhotos = CuratedPhotos();

  Future<List<Map<String, dynamic>>> getCuratedImagesFromDataProvider() async{

    curatedList = await curatedPhotos.getCuratedPhotos();
    notifyListeners();
    return curatedList;
  }
}