import 'package:flutter/material.dart';
import 'package:free_wallpaper/business_logic_layer/backend_api/curated_images/curated_images_logic.dart';
import 'package:free_wallpaper/business_logic_layer/network_status/network_information.dart';
import 'package:free_wallpaper/ui_layer/home_page/home_page.dart';
import 'package:provider/provider.dart';

class NoNetworkConnection extends StatelessWidget {
  const NoNetworkConnection({super.key});

  @override
  Widget build(BuildContext context) {

    final connectivityState = Provider.of<NetworkState>(context);

    final curatedImages = Provider.of<CuratedImagesAPI>(context);

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No Internet Connection"),
            const Text("Please Turn on Mobile Data or Wifi and Try Again"),
            TextButton(onPressed: () async{

              ///call the getNetWorkState() method in the NetworkState class
              ///to get the network status
              connectivityState.getNetworkState();

              if(isDeviceHasConnection){
                ///if the isDeviceHasConnection variable gets true value then
                ///call the getCuratedImagesFromDataProvider() method in the
                ///CuratedImagesAPI class to call the Curated Images from the
                ///backend, and build it in the HomePage class
                await curatedImages.getCuratedImagesFromDataProvider();
                if(!context.mounted) return;

                ///then navigate to the Home Page
                ///
                ///using Navigator.pushReplacement() instead of Navigator.push()
                ///for pop this NoNetworkConnection Widget
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              }else{
                const snack = SnackBar(content: Text("Please Turn On Mobile Data"), duration: Duration(seconds: 2),);
                ScaffoldMessenger.of(context).showSnackBar(snack);
              }
            }, child: const Text("Try Again"))
          ],
        ),
      ),
    );
  }
}
