import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/app_theme_state_management/theme_mode_logic.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/image_url_index/image_url_index.dart';
import 'package:free_wallpaper/business_logic_layer/download_image_to_downloads/download_images_to_downloads.dart';
import 'package:free_wallpaper/business_logic_layer/platform_specific_code/toast_widget_service/wallpaper_set_toast/toast_widget_service.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import 'business_logic_layer/backend_api/search_image/search_image_logic.dart';
import 'business_logic_layer/backend_api/search_image/search_image_page_count.dart';
import 'business_logic_layer/platform_specific_code/wallpaper_change_service/set_wallpaper.dart';

///this [darkThemeKeyValue] variable is used for getting the value from the [SharedPreferences]
///key called "darkTheme", to manage the App's theme. This [darkThemeKeyValue] variable
///is used in the [MaterialApp] widget inside the [MyApp] widget
late bool darkThemeKeyValue;

///late initialization for [SharedPreferences] instance
late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initializing the late sharedPreferences instance;
  sharedPreferences = await SharedPreferences.getInstance();

  //try to get the value of key called "darkTheme"
  try {
    darkThemeKeyValue = sharedPreferences.getBool("darkTheme")!;
  }
  //if any Exception occurs then assign false to the darkThemeKeyValue late variable
  catch (e){
    darkThemeKeyValue = false;
  }

  //creating an object for [CuratedImagesAPI] class
  final CuratedImagesAPI curatedImagesAPI = CuratedImagesAPI();
  //then call the getCuratedImagesFromDataProvider() using the object to return the list
  curatedList = await curatedImagesAPI.getCuratedImagesFromDataProvider();
  runApp(const MyApp());
}

// This widget is the root application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Here adding the Provider dependency injection for global access
      providers: [
        Provider(create: (context) => TextControllers()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => IndexNumber()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
        ChangeNotifierProvider(create: (context) => CuratedImagesAPI()),
        ChangeNotifierProvider(create: (context) => SearchImagePageCounter()),
        ChangeNotifierProvider(create: (context) => ChangeWallpaper()),
        Provider(create: (context) => ToastWidgetService()),
        ChangeNotifierProvider(create: (context) => DownloadImage()),
        ChangeNotifierProvider(create: (context) => AppThemeLogic()),
        ChangeNotifierProvider(create: (context) => ImageURLIndex()),
      ],
      child: Consumer<AppThemeLogic>(builder: (context, themeState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          ///if the darkThemeKeyValue and the isThemeSwitched variable is true
          ///then change to darkMode or lightMode
          theme: darkThemeKeyValue == true
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          home: const HomePage(),
        );
      }),
    );
  }
}
