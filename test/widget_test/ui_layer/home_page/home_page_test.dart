import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/sample_images/sample_images.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';

void main(){

  testWidgets("HomePage Test", (widgetTester) async{

    await widgetTester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.byType(Text), findsWidgets);//passed
    expect(find.text("Free Wallpapers"), findsWidgets);//passed
    expect(find.byType(Container), findsWidgets);//passed
    expect(find.byType(Column), findsWidgets);//passed
    expect(find.byType(TextFormField), findsWidgets);//passed
    expect(find.text("Type here to Search"), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(CupertinoIcons.search), findsWidgets);//passed
    expect(find.byType(SampleImages), findsWidgets);//passed
    expect(find.byType(BottomNavigation), findsOneWidget);//passed
  });
}