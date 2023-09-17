import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/app_style_provider/style.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/index_number_state_management.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/app_theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    ///here needed the IndexNumber Provider class for manging the state of
    ///BottomNavigationBar's currentIndex number. If the user Presses the
    ///arrow_back Icon then Navigate to the HomePage Widget and also change the
    ///currentIndex number to 0.
    final bottomNavigationIndexNumber = Provider.of<IndexNumber>(context);
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Style>(
          builder: (context, appBarTitleColorState, child) {
            return Text("Settings", style: TextStyle(color: appBarTitleColor),);
          }
        ),
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  ///call the changeIndex() method in the IndexNumber class
                  ///to change the currentIndex of BottomNavigationBar
                  bottomNavigationIndexNumber.changeIndex(0);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [AppTheme()],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
