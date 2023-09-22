import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../riverpod/state_notifier_providers/app_style_provider/style.dart';
import '../../../riverpod/state_notifier_providers/switch_state/theme_mode_logic.dart';

//this class is for managing the app Theme
class DarkThemeSwitch extends StatelessWidget {
  const DarkThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Dark Mode"),
        Consumer(builder: (context, ref, child) {
          return Switch(
              activeColor: Colors.white,

              ///the darkThemeKeyValue late variable works in the SharedPreferences
              ///this variable holds the value of the Switch.
              value: ref.watch(switchStateValue),
              onChanged: (value) async {
                ///call the changeThemeMode() method using the value from the
                ///onChanged function, to change the Switch Widget's state
                await ref
                    .read(switchStateValue.notifier)
                    .changeThemeMode(value);

                ///need to rebuild the Colors of Constants in Style class
                ///so call the Style class's method based on the onChanged
                ///function's value
                if (value == true) {
                  ref.read(style.notifier).darkTheme();
                } else {
                  ref.read(style.notifier).lightTheme();
                }
              });
        }),
      ],
    );
  }
}
