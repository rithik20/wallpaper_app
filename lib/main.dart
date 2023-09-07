import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/business_logic_layer/search_image/search_image_page_count.dart';
import 'package:free_wallpaper/business_logic_layer/text_controllers_provider/text_controllers.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:provider/provider.dart';
import 'business_logic_layer/search_image/search_image_logic.dart';
import 'business_logic_layer/search_image/download_image/download_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      ///here we adding our provider dependency injection for global access
      providers: [
        Provider(create: (context)=> TextControllers()),
        ChangeNotifierProvider(create: (context) => Style()),
        ChangeNotifierProvider(create: (context) => IndexNumber()),
        ChangeNotifierProvider(create: (context) => SearchedImageProvider()),
        ChangeNotifierProvider(create: (context) => SearchImagePageCounter()),
        ChangeNotifierProvider(create: (context) => ImageDownloader()),
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