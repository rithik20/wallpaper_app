import 'package:dio/dio.dart';
import 'package:free_wallpaper/data_layer/display_image/search_image_api_model.dart';

class SearchImageApiData {

  final Dio dio = Dio();

  ///call this class to get the images by using a search Query
  Future<List<Map<String, dynamic>>> searchedImages(String query) async {

    List<Map<String, dynamic>> list = [];

    //declaring Map for storing the Api data
    Map<String,dynamic> apiResult = {};

    String searchUrl =
        "https://api.pexels.com/v1/search?query= $query&per_page=80";

    try {
      final response = await dio.get(searchUrl,
          options: Options(headers: <String, String>{
            'Authorization':
                'WXYhACnUgdqxAC9Amo14poJxJt5ymB43XhCMlMjyaOQQ8kaYT3dMT6NL'
          }));

      if(response.statusCode == 200){

        apiResult = response.data;

        final searchImageApi = SearchImageApi.fromJson(apiResult);

        Map<String,dynamic> result = searchImageApi.toJson();

        list = result['photos'];

        return list;
      }else{
        return list;
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  ///call this method to get more images using the provided query
  Future<List<Map<String, dynamic>>> getMoreImages(String query, int pageNUmber) async{

    List<Map<String, dynamic>> moreImagesList = [];

    //declaring Map for storing the Api data
    Map<String,dynamic> apiResult = {};

    String searchUrl =
        "https://api.pexels.com/v1/search?query= $query&per_page=80&page=$pageNUmber";

    try {
      final response = await dio.get(searchUrl,
          options: Options(headers: <String, String>{
            'Authorization':
            'WXYhACnUgdqxAC9Amo14poJxJt5ymB43XhCMlMjyaOQQ8kaYT3dMT6NL'
          }));

      if(response.statusCode == 200){

        apiResult = response.data;

        final searchImageApi = SearchImageApi.fromJson(apiResult);

        Map<String,dynamic> result = searchImageApi.toJson();

        moreImagesList = result['photos'];

        return moreImagesList;
      }else{
        return moreImagesList;
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
