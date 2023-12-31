import 'package:free_wallpaper/riverpod/state_notifier_providers/switch_state/theme_mode_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeSettings{

  ///This method is called in the [SwitchChangeLogic] widget for Dark Mode Widget
  Future<void> appThemeSettings(bool theme) async{

    //initializing the SharedPreferences instance here
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    ///writing a key called "darkTheme" and assign the value from the
    ///functions argument
    preferences.setBool("darkTheme", theme);
  }
}