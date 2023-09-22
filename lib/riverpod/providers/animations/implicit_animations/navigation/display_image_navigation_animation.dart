import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';

//This class is for Animating the Route Transition to the DisplayImage Widget
class DisplayImageNavigationAnimation{

  ///This Animated Navigation is used to Navigate to the [DisplayImage] class
  ///this method is called in the [HomePageBody] class
  Route displayImageRouteAnimation(BuildContext context){
    return PageRouteBuilder(
        pageBuilder: (context, animation , secondAnimation) => const DisplayImage(),
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondAnimation, childWidget){
          const begin = Offset(0.0, 0.1);
          const end = Offset.zero;
          const curve = Curves.decelerate;
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offSetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offSetAnimation,
            child: childWidget,
          );
        },
    );
  }
}