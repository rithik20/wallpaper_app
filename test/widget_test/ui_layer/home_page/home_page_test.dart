import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing the late sharedPreferences instance;
  sharedPreferences = await SharedPreferences.getInstance();

  setUpAll(() async {
    //try to get the value of key called "darkTheme"
    try {
      darkThemeKeyValue = sharedPreferences.getBool("darkTheme")!;
    }
    //if any Exception occurs then assign false to the darkThemeKeyValue late variable
    catch (e) {
      darkThemeKeyValue = false;
    }
  });

  testWidgets("HomePage Test", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    expect(find.byType(Scaffold), findsOneWidget); //passed
    expect(find.byType(AppBar), findsWidgets); //passed
    expect(find.byType(Text), findsWidgets); //passed
    expect(find.text("HD Wallpapers"), findsWidgets); //passed
    expect(find.byType(HomePageBody), findsWidgets); //passed
    expect(find.byType(BottomNavigation), findsOneWidget); //passed
  });
}
