import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_wallpaper/ui_layer/display_page/display_page_body.dart';
import '../../riverpod/providers/riverpod_providers.dart';
import '../../riverpod/state_notifier_providers/search_image_api/search_image/search_image_page_count.dart';

class DisplayImage extends ConsumerWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textController = ref.watch(textControllers);
    final searchImagePageCounter = ref.watch(searchImagePageCounterClass);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  ///need to clear the searchImage TextEditingController value
                  ///and also reset the PageNumber to default value
                  textController.searchImageQuery.clear();
                  searchImagePageCounter.resetPageNumber();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: const DisplayImageBody(),
    );
  }
}
