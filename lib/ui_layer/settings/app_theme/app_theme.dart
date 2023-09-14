import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/app_theme_state_management/theme_mode_logic.dart';
import 'package:free_wallpaper/main.dart';
import 'package:provider/provider.dart';

//this class is for managing the app Theme
class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {

    final style = Provider.of<Style>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Dark Mode"),
        Consumer<AppThemeLogic>(
          builder: (context, switchState, child) {
            return Switch(
              activeColor: Colors.white,
              ///the darkThemeKeyValue late variable works in the SharedPreferences
              ///this variable holds the value of the Switch.
                value: darkThemeKeyValue,
                onChanged: (value) async{
                  ///need to rebuild the Colors of Constants in Style class
                  ///so call the Style class's method based on the onChanged
                  ///function's value
                  if(value == true){
                    style.darkTheme();
                  }else{
                    style.lightTheme();
                  }
                  ///call the changeThemeMode() method using the value from the
                  ///onChanged function, to change the Switch Widget's state
                  await switchState.changeThemeMode(value);
                });
          }
        ),
      ],
    );
  }
}
