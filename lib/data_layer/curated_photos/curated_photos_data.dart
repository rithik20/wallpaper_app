import 'package:dio/dio.dart';
import 'package:free_wallpaper/data_layer/curated_photos/curated_photos_data_model.dart';

class CuratedPhotos {
  final Dio dio = Dio();

  Future<List<Map<String, dynamic>>> getCuratedPhotos() async {
    List<Map<String, dynamic>> curatedList = [];
    Map<String, dynamic> modelMap = {};

    try {
      //calling the curated api to get the result
      final response = await dio.get("https://api.pexels.com/v1/curated?page=1&per_page=80",
          options: Options(headers: <String, String>{
            'Authorization':
            'WXYhACnUgdqxAC9Amo14poJxJt5ymB43XhCMlMjyaOQQ8kaYT3dMT6NL'
          }));
      if (response.statusCode == 200) {
        ///if getting the result from the API Then,
        ///pass that value to the model class CuratedImagesApiModel's fromJson method
        final curatedModel = CuratedImagesApiModel.fromJson(response.data);
        modelMap = curatedModel.toJson();

        ///add that map to the curatedList
        curatedList = modelMap['photos'];
      }else{

      }
    }on DioException catch(e){
      throw e.toString();
    }

    ///finally return the curatedList
    return curatedList;
  }
}
