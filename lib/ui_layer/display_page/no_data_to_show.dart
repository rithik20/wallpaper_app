import 'package:flutter/material.dart';

//this Widget will show an Image to the user if the user can't get any results from backend
class NoDataToShow extends StatelessWidget {
  const NoDataToShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child:
              Image.asset("assets/ui_layer/display_page/no_data_to_show.jpg"),
        ),
      ),
    );
  }
}
