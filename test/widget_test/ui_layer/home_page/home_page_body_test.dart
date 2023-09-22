import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/ui_layer/home_page/curated_images/curated_images.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';

void main(){
  testWidgets("HomePageBody Test", (widgetTester) async{

    await widgetTester.pumpWidget(const ProviderScope(
      child: MaterialApp(
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