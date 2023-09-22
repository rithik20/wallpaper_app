import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/bottom_navigation_index/index_number_state_management.dart';
import 'package:free_wallpaper/ui_layer/settings/app_theme/dark_theme_switch.dart';
import '../../riverpod/state_notifier_providers/app_style_provider/style.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InitialAppWidgetColors styles = ref.watch(style);
    ///here needed the IndexNumber Provider class for manging the state of
    ///BottomNavigationBar's currentIndex number. If the user Presses the
    ///arrow_back Icon then Navigate to the HomePage Widget and also change the
    ///currentIndex number to 0.
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: styles.appBarTitleColor),),
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  ///call the changeIndex() method in the IndexNumber class
                  ///to change the currentIndex of BottomNavigationBar
                  ref.read(indexNumberState.notifier).changeIndex(0);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [DarkThemeSwitch()],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
