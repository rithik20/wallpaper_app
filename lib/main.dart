import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/app_theme_state_management/dark_mode_logic.dart';
import 'package:free_wallpaper/business_logic_layer/curated_images/curated_images_logic.dart';
import 'package:free_wallpaper/business_logic_layer/platform_specific_code/wallpaper_service/set_wallpaper.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_page_count.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:provider/provider.dart';
import 'business_logic_layer/search_image/search_image_logic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ///Here adding the [Provider] dependency injection for global access
      providers: [
        Provider(create: (context) => TextControllers()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => IndexNumber()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
        ChangeNotifierProvider(create: (context) => CuratedImagesAPI()),
        ChangeNotifierProvider(create: (context) => SearchImagePageCounter()),
        ChangeNotifierProvider(create: (context) => ChangeWallpaper()),
        ChangeNotifierProvider(create: (context) => AppThemeLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
