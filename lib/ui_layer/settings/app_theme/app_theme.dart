import 'package:flutter/material.dart';

//this class is for managing the app Theme
class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Dark Mode"),
        Switch(value: false, onChanged:(value){}),
      ],
    );
  }
}
