import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_wallpaper/business_logic_layer/animations/implicit_animations/navigation/bottom_navigation_animation.dart';
import 'package:free_wallpaper/business_logic_layer/animations/implicit_animations/navigation/display_image_navigation_animation.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/app_theme_state_management/theme_mode_logic.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/curated_images/curated_images_page_count.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/image_details/image_details.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/search_image/search_image_logic.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/search_image/search_image_page_count.dart';
import 'package:free_wallpaper/business_logic_layer/controllers/scroll_controllers/scroll_controllers.dart';
import 'package:free_wallpaper/business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/business_logic_layer/download_image_to_downloads/download_images_to_downloads.dart';
import 'package:free_wallpaper/business_logic_layer/network_status/network_information.dart';
import 'package:free_wallpaper/business_logic_layer/platform_specific_code/toast_widget_service/wallpaper_set_toast/toast_widget_service.dart';
import 'package:free_wallpaper/business_logic_layer/platform_specific_code/wallpaper_change_service/set_wallpaper.dart';
import 'package:free_wallpaper/main.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //initializing the late sharedPreferences instance;
  sharedPreferences = await SharedPreferences.getInstance();

  setUpAll(() async{

    //try to get the value of key called "darkTheme"
    try {
      darkThemeKeyValue = sharedPreferences.getBool("darkTheme")!;
    }
    //if any Exception occurs then assign false to the darkThemeKeyValue late variable
    catch (e) {
      darkThemeKeyValue = false;
    }
  });

  testWidgets("HomePage Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        Provider(create: (context)=> TextControllers()),
        Provider(create: (context) => ScrollControllers()),
        Provider(create: (context) => ToastWidgetService()),
        Provider(create: (context) => BottomNavigationAnimation()),
        Provider(create: (context) => DisplayImageNavigationAnimation()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
        ChangeNotifierProvider(create: (context) => IndexNumberState()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
        ChangeNotifierProvider(create: (context) => CuratedImagesAPI()),
        ChangeNotifierProvider(create: (context) => CuratedImagePageCounter()),
        ChangeNotifierProvider(create: (context) => SearchImagePageCounter()),
        ChangeNotifierProvider(create: (context) => ChangeWallpaper()),
        ChangeNotifierProvider(create: (context) => DownloadImage()),
        ChangeNotifierProvider(create: (context) => AppThemeLogic()),
        ChangeNotifierProvider(create: (context) => ImageProviderClass()),
        ChangeNotifierProvider(create: (context) => NetworkState()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ));

    expect(find.byType(Scaffold), findsOneWidget);//passed
    expect(find.byType(AppBar), findsWidgets);//passed
    expect(find.byType(Text), findsWidgets);//passed
    expect(find.text("HD Wallpapers"), findsWidgets);//passed
    expect(find.byType(HomePageBody), findsWidgets);//passed
    expect(find.byType(BottomNavigation), findsOneWidget);//passed
  });
}