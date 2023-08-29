import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: IconButton(
              color: Colors.black,
              onPressed: () {
                ///this is for user to set the image us Wallpaper
              },
              icon: const Icon(Icons.done),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              ///this button is for downloading the image to the user's device
            },
            child: const Icon(CupertinoIcons.down_arrow),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
