import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/search_image/search_image_logic.dart';
import 'package:free_wallpaper/business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/home_page/curated_images/curated_images.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:provider/provider.dart';

void main(){
  testWidgets("HomePageBody Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context)=> TextControllers()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
      ],
      child: const MaterialApp(
        home: HomePageBody(),
      ),
    ));

    expect(find.byType(Container), findsWidgets);//passed
    expect(find.byType(Column), findsWidgets);//passed
    expect(find.byType(TextFormField), findsWidgets);//passed
    expect(find.text("Type here to Search"), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(CupertinoIcons.search), findsWidgets);//passed
    expect(find.byType(CuratedImages), findsWidgets);//passed
  });
}