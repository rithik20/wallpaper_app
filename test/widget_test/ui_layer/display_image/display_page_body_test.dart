import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_logic.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:provider/provider.dart';

void main(){

  testWidgets("DisplayImage Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context)=> TextControllers()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
      ],
      child: const MaterialApp(
        home: DisplayImageBody(),
      ),
    ));

    expect(find.byType(SizedBox), findsOneWidget);//passed
    expect(find.byType(Column), findsOneWidget);//passed
    expect(find.byType(Expanded), findsOneWidget);//passed
  });
}