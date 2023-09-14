import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Style extends ChangeNotifier {
  //search button color
  Color searchButtonColor = Colors.black;

  Color bottomNavigationItemColor = Colors.black;

  Text appBarTitle = const Text("HD Wallpapers",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));

  Color appBarTitleColor = Colors.black;


  Future<void> darkTheme() async{

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    appBarTitleColor = Colors.white;
    searchButtonColor = Colors.white;
    bottomNavigationItemColor = Colors.white;
    appBarTitle = const Text("HD Wallpapers",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));

    sharedPreferences.setBool("appBarTitleColor", true);
    sharedPreferences.setBool("searchButtonColor", true);
    sharedPreferences.setBool("bottomNavigationItemColor", true);
    sharedPreferences.setBool("appBarTitle", true);

    notifyListeners();
  }

  Future<void> lightTheme() async{

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    appBarTitleColor = Colors.black;
    searchButtonColor = Colors.black;
    bottomNavigationItemColor = Colors.black;
    appBarTitle = const Text("HD Wallpapers",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));

    sharedPreferences.setBool("appBarTitleColor", false);
    sharedPreferences.setBool("searchButtonColor", false);
    sharedPreferences.setBool("bottomNavigationItemColor", false);
    sharedPreferences.setBool("appBarTitle", false);

    notifyListeners();
  }
}
