import 'dart:async';
import 'package:flutter/material.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

late bool isDeviceHasConnection;

///Use this class to get the status of Device's network state
///with the help of [InternetConnectionChecker] package
///
class NetworkState extends ChangeNotifier {
  ///call this method to get the latest state of network
  ///and the [isDeviceHasConnection] will change it's state to new one.
  ///by using the [InternetConnectionChecker]'s hasConnection
  ///
  /// this method is called in the [HomePageBody] and the [DisplayImageBody] Widgets
  Future<void> getNetworkState() async {
    isDeviceHasConnection = await InternetConnectionChecker().hasConnection;
    notifyListeners();
  }
}
