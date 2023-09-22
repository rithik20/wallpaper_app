import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/dark_theme_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data_layer/shared_preferences/app_settings/app_settings.dart';

///This class is the state provider of [Switch] widget's value parameter in the
///[DarkThemeSwitch] widget class
class CurrentSwitchState{

  bool currentSwitchValue;

  CurrentSwitchState({required this.currentSwitchValue});
}

///this class is managing the state of [Switch] widget in the [DarkThemeSwitch] Widget class
class SwitchChangeLogic extends StateNotifier<bool>{

  ///here passing the [darkThemeKeyValue] variable as the initialValue to the
  ///[CurrentSwitchState] class. The [darkThemeKeyValue] is declared in the
  ///main.dart file as a late variable
  SwitchChangeLogic() : super(darkThemeKeyValue);

  ///need the [AppThemeSettings] class dependency here to store the
  ///value of darkMode to the [SharedPreferences] key called "darkTheme"
  final AppThemeSettings appThemeSettings = AppThemeSettings();

  ///call this method if the user need to change the theme of the app
  ///the [DarkThemeSwitch] class is responsible to perform this [SwitchChangeLogic] class
  ///and this [changeThemeMode] method
  ///
  Future<void> changeThemeMode(bool value) async{
    ///update this change in the SharedPreferences storage
    await appThemeSettings.appThemeSettings(value);
    state = value;
  }
}

final switchStateValue = StateNotifierProvider<SwitchChangeLogic, bool>((ref) => SwitchChangeLogic());