import 'package:flutter/services.dart';
import 'package:free_wallpaper/data_layer/platform_specific_code/toast_widget/toast_widget_api.dart';

//this class is for Accessing the Toast Widget from the Native Android side
class ToastWidgetService{

  //need the ToastWidgetAPI class dependency here
  final ToastWidgetAPI toastWidgetAPI = ToastWidgetAPI();

  Future<void> getSuccessToastMessage() async{

    ///calling the showSuccessToastWidget() method in the ToastWidgetAPI
    ///to show the Success Toast Widget in the Flutter UI
    try {
      await toastWidgetAPI.showSuccessToastWidget();
    }on PlatformException catch(e){
      throw e.toString();
    }
  }

  Future<void> getUnSuccessToastMessage() async{

    ///calling the showToastWidget() method in the ToastWidgetAPI
    ///to show the UnSuccess Toast Widget in the Flutter UI
    try{
      await toastWidgetAPI.showUnSuccessToastWidget();
    }on PlatformException catch(e){
      throw e.toString();
    }
  }
}