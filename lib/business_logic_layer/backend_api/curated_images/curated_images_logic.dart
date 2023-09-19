import 'package:flutter/material.dart';
import '../../../data_layer/backend_api/curated_photos/curated_photos_data.dart';

class CuratedImagesAPI extends ChangeNotifier {
  //need the CuratedPhotos class to work with Curated API from backend
  final CuratedPhotos curatedPhotos = CuratedPhotos();

  ///The backend Api is adding new photos in every hour so use Stream here
  Stream<List<Map<String, dynamic>>> getCuratedPhotos() async* {
    while (true) {
      yield await curatedPhotos.getCuratedPhotos();
      await Future.delayed(const Duration(hours: 1));
    }
  }
}
