import 'package:flutter/material.dart';

class NoNetworkConnection extends StatelessWidget {
  const NoNetworkConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Internet Connection"),
            Text("Please Turn on Mobile Data or Wifi"),
          ],
        ),
      ),
    );
  }
}
