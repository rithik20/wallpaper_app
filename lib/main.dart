import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/riverpod/providers/network_status/network_information.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/app_style_provider/style.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/switch_state/theme_mode_logic.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/no_network_connection_page/no_network_connection_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic_layer/permission_handler/storage_permission.dart';

///this [darkThemeKeyValue] variable is used for getting the value from the [SharedPreferences]
///key called "darkTheme", to manage the App's theme. This [darkThemeKeyValue] variable
///is used in the [MaterialApp] widget inside the [MyApp] widget
late bool darkThemeKeyValue;

///late initialization for [SharedPreferences] instance
late SharedPreferences sharedPreferences;

///the main method of this Application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  storageStatusCheck = await Permission.storage.status;
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

  //created object for the NetworkState class to call the getNetworkState()
  final NetworkState networkState = NetworkState();

  //call the getNetworkState() method and initialize the isDeviceHasConnection late variable
  await networkState.getNetworkState();

  runApp(const ProviderScope(child: MyApp()));
}

// This widget is the root application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,

          ///if the darkThemeKeyValue is declared in main.dart file if the
          ///variable is true, then change to darkMode or lightMode
          ///the darkThemeKeyValue's state is Changing in the AppThemeLogic class
          theme: ref.watch(switchStateValue) == true
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),

          ///if the Device has network connection, then call the HomePage.
          ///otherwise  NoNetworkConnection page.
          ///the getNetworkStream() is declared in the NetWorkState class
          home: StreamBuilder<bool>(
            stream: NetworkState().getNetworkStream(),
            builder: (context, networkState) {
              if (networkState.data == true) {
                return const HomePage();
              } else {
                return const NoNetworkConnection();
              }
            },
          ));
    });
  }
}
