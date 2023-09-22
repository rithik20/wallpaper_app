import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/riverpod/providers/controllers/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';

void main() {
  testWidgets("DisplayPage Test", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
          home: DisplayImage(),
        ),
    );

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsOneWidget);//passed
    expect(find.byType(Text), findsOneWidget);//passed
    expect(find.text(TextControllers().searchImageQuery.value.text.toUpperCase()), findsOneWidget);//passed
    expect(find.byType(IconButton), findsOneWidget);//passed
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byType(DisplayImageBody), findsOneWidget);//passed
  });
}
