import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/app_style_provider/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Provider.of<Style>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: style.appBarTitle,
        centerTitle: true,
      ),
      body: const HomePageBody(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
