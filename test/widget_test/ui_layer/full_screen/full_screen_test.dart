import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/ui_layer/full_screen/full_screen.dart';

void main(){

  testWidgets("FullScreen Test", (widgetTester) async{

    await widgetTester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: FullScreen(),
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);
  });
}