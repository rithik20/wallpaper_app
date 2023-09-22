import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page_body.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';
import '../../riverpod/state_notifier_providers/app_style_provider/style.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final styles = ref.watch(style);
    return Scaffold(
      appBar: AppBar(
        title: Text("HD Wallpapers",
          style: TextStyle(color: styles.appBarTitleColor,
              fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: const HomePageBody(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
