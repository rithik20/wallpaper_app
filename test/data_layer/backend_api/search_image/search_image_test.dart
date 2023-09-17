import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/data_layer/backend_api/search_image/search_image_api.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main(){

  test("SearchImageApi Test", () async{

    final SearchImageApiData searchImageApiData = SearchImageApiData();

    List list = await searchImageApiData.searchedImages("nature");

    expect(list.length, 80);//passed
  });
}