import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:free_wallpaper/ui_layer/settings/settings.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final IndexNumber indexNumber = IndexNumber();

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      currentIndex: indexNumber.index,
      selectedItemColor: Colors.indigoAccent,
      onTap: (value) {
        indexNumber.changeIndex(value);

        if(indexNumber.index == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Settings()));
        }
      },
    );
  }
}
