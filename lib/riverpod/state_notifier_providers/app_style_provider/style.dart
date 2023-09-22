import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';

@immutable
class InitialAppWidgetColors {
  final Color appBarTitleColor;
  final Color searchButtonColor;
  final Color bottomNavigationItemColor;

  const InitialAppWidgetColors(
      {required this.appBarTitleColor,
      required this.searchButtonColor,
      required this.bottomNavigationItemColor});

  InitialAppWidgetColors clone(Color appBarTitleColor, Color searchButtonColor,
      Color bottomNavigationItemColor) {
    return InitialAppWidgetColors(
        appBarTitleColor: appBarTitleColor,
        searchButtonColor: searchButtonColor,
        bottomNavigationItemColor: bottomNavigationItemColor);
  }
}

class AppWidgetColors extends StateNotifier<InitialAppWidgetColors> {
  AppWidgetColors()
      : super(InitialAppWidgetColors(
            appBarTitleColor: appBarTitleColor,
            searchButtonColor: searchButtonColor,
            bottomNavigationItemColor: bottomNavigationItemColor));

  void darkTheme() {
    state = state.clone(Colors.white, Colors.white, Colors.white);
  }

  void lightTheme() {
    state = state.clone(Colors.black, Colors.black, Colors.black);
  }
}

///this [searchButtonColor] is used in the [HomePage] class's [TextFormField]
late Color searchButtonColor;

///this [bottomNavigationItemColor] is used in the [BottomNavigation] class's
///selectedItemColor parameter
late Color bottomNavigationItemColor;

///this [appBarTitleColor] is used in the [HomePage] and the [Settings] Widget class's
///[AppBar] widget
late Color appBarTitleColor;

///these two functions is called to assign values to the above late variables
///is called in the main function of this application
void sharedPreferencesDarkTheme() {
  appBarTitleColor = Colors.white;
  searchButtonColor = Colors.white;
  bottomNavigationItemColor = Colors.white;
}

void sharedPreferencesLightTheme() {
  appBarTitleColor = Colors.black;
  searchButtonColor = Colors.black;
  bottomNavigationItemColor = Colors.black;
}

final style = StateNotifierProvider<AppWidgetColors, InitialAppWidgetColors>(
    (ref) => AppWidgetColors());
