import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';

class Style extends ChangeNotifier {
  void darkTheme() {
    appBarTitleColor = Colors.white;
    searchButtonColor = Colors.white;
    bottomNavigationItemColor = Colors.white;

    notifyListeners();
  }

  void lightTheme() {
    appBarTitleColor = Colors.black;
    searchButtonColor = Colors.black;
    bottomNavigationItemColor = Colors.black;

    notifyListeners();
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
