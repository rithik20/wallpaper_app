import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';

void main(){

  testWidgets("DisplayImage Test", (widgetTester) async{

    await widgetTester.pumpWidget(const MaterialApp(
        home: DisplayImageBody(),
      ));

    expect(find.byType(SizedBox), findsOneWidget);//passed
    expect(find.byType(Column), findsOneWidget);//passed
    expect(find.byType(Expanded), findsOneWidget);//passed
  });
}