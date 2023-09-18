import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/controllers/text_controllers_provider/text_controllers.dart';

//this Widget will show an Image to the user if the user can't get any results from backend
class NoDataToShow extends StatelessWidget {
  const NoDataToShow({super.key});

  @override
  Widget build(BuildContext context) {
    final textControllers = Provider.of<TextControllers>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>
            IconButton(onPressed: (){
              ///in going back also clear the searchImageQuery's value
              textControllers.searchImageQuery.clear();
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back))),
      ),
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
