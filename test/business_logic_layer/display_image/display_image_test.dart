import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/data_layer/display_image/search_image_api.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio{}

void main(){

  test("SearchImageApi Test", () async{

    final SearchImageApiData searchImageApiData = SearchImageApiData();

    List list = await searchImageApiData.searchedImages("nature");

    expect(list.length, 80);
  });
}