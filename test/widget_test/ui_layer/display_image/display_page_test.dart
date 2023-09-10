import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_logic.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_page_count.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/display_page/get_more_images.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("DisplayPage Test", (widgetTester) async {
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [
          Provider(create: (context)=> TextControllers()),
          ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
          ChangeNotifierProvider(create: (context) => SearchImagePageCounter()),
        ],
        child: const MaterialApp(
          home: DisplayImage(),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsOneWidget);//passed
    expect(find.byType(Text), findsOneWidget);//passed
    expect(find.text(TextControllers().searchImageQuery.value.text.toUpperCase()), findsOneWidget);//passed
    expect(find.byType(IconButton), findsOneWidget);//passed
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byType(DisplayImageBody), findsOneWidget);//passed
    expect(find.byType(GetMoreImages), findsOneWidget);//passed
  });
}
