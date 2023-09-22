import '../../../../data_layer/backend_api/curated_photos/curated_photos_data.dart';

class CuratedImagesAPI {
  ///need the [CuratedPhotos] class to work with Curated API from backend
  final CuratedPhotos curatedPhotos = CuratedPhotos();

  ///The backend Api is adding new photos in every hour so use [Stream] here
  ///this will return a List in every one hour
  Stream<List<Map<String, dynamic>>> getCuratedPhotos() async* {
    while (true) {
      ///the getCuratedPhotos() in the CuratedPhotos class return's
      ///the CuratedImages List
      yield await curatedPhotos.getCuratedPhotos();
      await Future.delayed(const Duration(hours: 1));
    }
  }
}
