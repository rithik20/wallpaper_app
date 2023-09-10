import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_theme_state_management/dark_mode_logic.dart';
import 'package:provider/provider.dart';

//this class is for managing the app Theme
class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemeLogic = Provider.of<AppThemeLogic>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Dark Mode"),
        Switch(
          ///the AppTheme class has a variable called isThemeSwitched, this
          ///variable holds the value of the Switch.
            value: appThemeLogic.isThemeSwitched,
            onChanged: (value) {
              ///call the changeThemeMode() method using the value from the
              ///onChanged function, to change the Switch Widget's state
              appThemeLogic.changeThemeMode(value);
            }),
      ],
    );
  }
}
