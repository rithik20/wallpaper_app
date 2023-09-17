import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/data_layer/backend_api/curated_photos/curated_photos_data.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main(){

  test("Curated Images Api Test", () async{

    final CuratedPhotos curatedPhotos = CuratedPhotos();

    List<Map<String, dynamic>> list = await curatedPhotos.getCuratedPhotos();

    expect(list.length, 80);//passed
  });
}