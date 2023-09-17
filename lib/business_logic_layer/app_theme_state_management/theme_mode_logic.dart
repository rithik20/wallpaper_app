import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/shared_preferences/app_settings/app_settings.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this class is for App's theme change
class AppThemeLogic extends ChangeNotifier{


  ///need the [AppThemeSettings] class dependency here to store the
  ///value of darkMode to the [SharedPreferences] key called "darkTheme"
  final AppThemeSettings appThemeSettings = AppThemeSettings();

  ///call this method if the user need to change the theme of the app
  ///the [AppTheme] class is responsible to perform this [AppThemeLogic] class
  ///and this [changeThemeMode] method
  ///
  Future<void> changeThemeMode(bool value) async{

    darkThemeKeyValue = value;
    await appThemeSettings.appThemeSettings(value);
    notifyListeners();
  }
}