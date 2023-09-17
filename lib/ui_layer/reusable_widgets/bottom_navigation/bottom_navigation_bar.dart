import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_wallpaper/business_logic_layer/animations/implicit_animations/navigation/bottom_navigation_animation.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../business_logic_layer/app_style_provider/style.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final bottomAnimation = Provider.of<BottomNavigationAnimation>(context);

    return GetBuilder<IndexNumberState>(
      builder: (_) {
        return Consumer<Style>(
            builder: (context, bottomNavigationItemColorState, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
            currentIndex: _.index,
            selectedItemColor: bottomNavigationItemColor,
            onTap: (value) {
              _.changeIndex(value);

              if (_.index == 0) {
                Navigator.of(context).push(bottomAnimation.homeBottomNavigationRouteAnimation(context));
              } else {
                Navigator.of(context).push(bottomAnimation.settingsBottomNavigationRouteAnimation(context));
              }
            },
          );
        });
      }
    );
  }
}
