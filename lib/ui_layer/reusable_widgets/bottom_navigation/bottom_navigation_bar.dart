import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Search"),
    ]);
  }
}
