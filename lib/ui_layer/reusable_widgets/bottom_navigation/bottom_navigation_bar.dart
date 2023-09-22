import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/riverpod/state_notifier_providers/bottom_navigation_index/index_number_state_management.dart';
import '../../../riverpod/providers/riverpod_providers.dart';
import '../../../riverpod/state_notifier_providers/app_style_provider/style.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomAnimation = ref.watch(bottomNavigationAnimation);
    final styles = ref.watch(style);
    final index = ref.watch(indexNumberState);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      currentIndex: index.indexNumber,
      selectedItemColor: styles.bottomNavigationItemColor,
      onTap: (value) {
        ///calling the changeIndex method in the IndexNumberState class
        ///with argument from the onTap
        ref.read(indexNumberState.notifier).changeIndex(value);

        if (index.indexNumber == 0) {
          Navigator.of(context).push(
              bottomAnimation.homeBottomNavigationRouteAnimation(context));
        } else {
          Navigator.of(context).push(
              bottomAnimation.settingsBottomNavigationRouteAnimation(context));
        }
      },
    );
  }
}
