import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';

//This class is for Animating the Route Transitions For BottomNavigation Bar Items
class BottomNavigationAnimation {

  ///This Animated Navigation is used to Navigate to the [Settings] class
  ///this method is called only in the [BottomNavigation] class
  Route settingsBottomNavigationRouteAnimation(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => const Settings(),
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondAnimation, childWidget) {
          const begin = Offset(0.0, 0.1);
          const end = Offset.zero;
          const curve = Curves.decelerate;
          final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));
          final offSetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offSetAnimation,
            child: childWidget,
          );
        }
    );
  }

  ///This Animated Navigation is used to Navigate to the [HomePage] class
  ///this method is called only in the [BottomNavigation] class
  Route homeBottomNavigationRouteAnimation(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => const HomePage(),
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondAnimation, childWidget) {
          const begin = Offset(0.0, 0.1);
          const end = Offset.zero;
          const curve = Curves.decelerate;
          final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));
          final offSetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offSetAnimation,
            child: childWidget,
          );
        }
    );
  }
}