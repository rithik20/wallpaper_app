import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'curated_photos_data_model.dart';

class CuratedPhotos {

  ///this [getCuratedPhotos] method will return a Curated images [List]
  ///after the API call to the backend
  Future<List<Map<String, dynamic>>> getCuratedPhotos() async {
    List<Map<String, dynamic>> curatedList = [];
    Map<String, dynamic> modelMap = {};

    try {
      //calling the curated api to get the result
      final response = await http.get(
          Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=80"),
          headers: <String, String>{
            'Authorization':
                'WXYhACnUgdqxAC9Amo14poJxJt5ymB43XhCMlMjyaOQQ8kaYT3dMT6NL'
          });
      if (response.statusCode == 200) {
        //if getting the result from the API Then,
        modelMap = jsonDecode(response.body);
        //pass that value to the model class CuratedImagesApiModel's fromJson method
        final curatedModel = CuratedImagesApiModel.fromJson(modelMap);
        Map<String, dynamic> curatedMap = curatedModel.toJson();

        //add that map to the curatedList
        curatedList = curatedMap['photos'];
      } else {
        return curatedList;
      }
    } on HttpException catch (e) {
      throw e.toString();
    }

    //finally return the curatedList
    return curatedList;
  }

  ///this [getMoreCuratedPhotos] method will return a [List] with additional
  ///images from the backend this method need a [pageNumber] as argument
  ///inorder to call the API
  Future<List<Map<String, dynamic>>> getMoreCuratedPhotos(
      int pageNumber) async {
    List<Map<String, dynamic>> curatedList = [];
    Map<String, dynamic> modelMap = {};

    try {
      //calling the curated api to get the result
      final response = await http.get(
          Uri.parse(
              "https://api.pexels.com/v1/curated?page=$pageNumber&per_page=80"),
          headers: <String, String>{
            'Authorization':
                'WXYhACnUgdqxAC9Amo14poJxJt5ymB43XhCMlMjyaOQQ8kaYT3dMT6NL'
          });
      if (response.statusCode == 200) {
        //if getting the result from the API Then,
        modelMap = jsonDecode(response.body);
        //pass that value to the model class CuratedImagesApiModel's fromJson method
        final curatedModel = CuratedImagesApiModel.fromJson(modelMap);
        Map<String, dynamic> curatedMap = curatedModel.toJson();

        //add that map to the curatedList
        curatedList = curatedMap['photos'];
      } else {
        return curatedList;
      }
    } on HttpException catch (e) {
      throw e.toString();
    }

    //finally return the curatedList
    return curatedList;
  }
}
