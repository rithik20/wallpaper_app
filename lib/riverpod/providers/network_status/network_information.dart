import 'dart:async';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

late bool isDeviceHasConnection;

///Use this class to get the status of Device's network state
///with the help of [InternetConnectionChecker] package
///
class NetworkState{
  ///call this method to get the latest state of network
  ///and the [isDeviceHasConnection] will change it's state to new one.
  ///by using the [InternetConnectionChecker]'s hasConnection
  ///
  /// this method is called in the [HomePageBody] and the [DisplayImageBody] Widgets
  Future<void> getNetworkState() async {
    isDeviceHasConnection = await InternetConnectionChecker().hasConnection;
  }

  ///this [Stream] will check the Internet Connection Status in every seconds
  ///using [InternetConnectionChecker] package, and return's a boolean value
  Stream<bool> getNetworkStream() async* {
    while (true) {
      yield await InternetConnectionChecker().hasConnection;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
