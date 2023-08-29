import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/display_image/display_search_image.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:provider/provider.dart';

void main(){

  testWidgets("DisplayImage Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context)=> TextControllers()),
        ChangeNotifierProvider(create: (context) => DisplaySearchImageProvider()),
      ],
      child: const MaterialApp(
        home: DisplayImage(),
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.byType(Text), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);//passed
    expect(find.byType(SizedBox), findsWidgets);//passed
    expect(find.byType(Column), findsWidgets);//passed
    expect(find.byType(Expanded), findsWidgets);//passed
  });
}