import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/providers/riverpod_providers.dart';

//this Widget will show an Image to the user if the user can't get any results from backend
class NoDataToShow extends ConsumerWidget {
  const NoDataToShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(textControllers);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>
            IconButton(onPressed: (){
              ///in going back also clear the searchImageQuery's value
              textController.searchImageQuery.clear();
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
