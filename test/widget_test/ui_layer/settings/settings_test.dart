import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/app_theme.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';

void main(){

  testWidgets("Settings Test", (widgetTester) async{

    await widgetTester.pumpWidget(const MaterialApp(
      home: Settings(),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.text("Settings"), findsWidgets);//passed
    expect(find.byType(Builder), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(Icons.arrow_back), findsWidgets);//passed
    expect(find.byType(Container), findsWidgets);//passed
    expect(find.byType(Column), findsWidgets);//passed
    expect(find.byType(AppTheme), findsOneWidget);//passed
    expect(find.byType(BottomNavigation), findsOneWidget);//passed
  });
}