import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/reusable_widgets/bottom_navigation/bottom_navigation_bar.dart';

///This [BottomNavigationIndexNumber] class is the state of [BottomNavigation]
///class's currentIndex value
class BottomNavigationIndexNumber {
  ///this is the currentIndex value of [BottomNavigation] class
  int indexNumber;

  BottomNavigationIndexNumber({required this.indexNumber});
}

class IndexNumberState extends StateNotifier<BottomNavigationIndexNumber> {
  IndexNumberState() : super(BottomNavigationIndexNumber(indexNumber: 0));

  ///call this [changeIndex] method to change the [indexNumber] variable's value in
  ///the [BottomNavigationIndexNumber] class
  void changeIndex(int indexNumber) {
    state.indexNumber = indexNumber;
  }
}

final indexNumberState =
    StateNotifierProvider<IndexNumberState, BottomNavigationIndexNumber>(
        (ref) => IndexNumberState());
