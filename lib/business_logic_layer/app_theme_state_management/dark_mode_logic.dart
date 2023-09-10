import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/app_theme.dart';

//this class is for App's theme change
class AppThemeLogic extends ChangeNotifier{

  bool isThemeSwitched = false;

  ///call this method if the user need to change the theme of the app
  ///the [AppTheme] class is responsible to perform this [AppThemeLogic] class
  ///and this [changeThemeMode] method
  ///
  void changeThemeMode(bool value){

    isThemeSwitched = value;
    notifyListeners();
  }
}