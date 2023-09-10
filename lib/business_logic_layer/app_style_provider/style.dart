import 'package:flutter/material.dart';

class Style extends ChangeNotifier {
  //search button color
  Color searchButtonColor = Colors.black;

  Text appBarTitle = const Text("HD Wallpapers",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));

  Color appBarTitleColor = Colors.black;

  void darkTheme() {
    appBarTitleColor = Colors.white;
    appBarTitle = const Text("HD Wallpapers",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
    notifyListeners();
  }

  void lightTheme() {
    appBarTitleColor = Colors.black;
    appBarTitle = const Text("HD Wallpapers",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
    notifyListeners();
  }
}
