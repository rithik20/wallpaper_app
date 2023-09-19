import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/search_image/search_image_logic.dart';
import 'package:free_wallpaper/business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

void main(){

  testWidgets("HomePage Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context)=> TextControllers()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.byType(Text), findsWidgets);//passed
    expect(find.text("HD Wallpapers"), findsWidgets);//passed
    expect(find.byType(HomePageBody), findsWidgets);//passed
    expect(find.byType(BottomNavigation), findsOneWidget);//passed
  });
}