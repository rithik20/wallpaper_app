import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/app_style_provider/style.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/dark_theme_switch.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){

  setUpAll(() async{
    //initializing the late sharedPreferences instance;
    sharedPreferences = await SharedPreferences.getInstance();

    //try to get the value of key called "darkTheme"
    try {
      darkThemeKeyValue = sharedPreferences.getBool("darkTheme")!;
    }
    //if any Exception occurs then assign false to the darkThemeKeyValue late variable
    catch (e) {
      darkThemeKeyValue = false;
    }
    if (darkThemeKeyValue == true) {
      sharedPreferencesDarkTheme();
    } else {
      sharedPreferencesLightTheme();
    }
  });

  testWidgets("Settings Test", (widgetTester) async{

    await widgetTester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: Settings(),
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.text("Settings"), findsWidgets);//passed
    expect(find.byType(Builder), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(Icons.arrow_back), findsWidgets);//passed
    expect(find.byType(Container), findsWidgets);//passed
    expect(find.byType(Column), findsWidgets);//passed
    expect(find.byType(DarkThemeSwitch), findsOneWidget);//passed
    expect(find.byType(BottomNavigation), findsOneWidget);//passed
  });
}