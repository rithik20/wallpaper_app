import 'package:flutter/services.dart';

class ToastWidgetAPI{

  static const toast = MethodChannel("wallpaper");

  Future<void> showSuccessToastWidget() async{
    try {
      await toast.invokeMethod("show_success_toast_message");
    }on PlatformException catch(e){
      throw e.toString();
    }
  }

  Future<void> showUnSuccessToastWidget() async{

    try{
      await toast.invokeMethod("show_not_success_toast_message");
    }on PlatformException catch(e){
      throw e.toString();
    }
  }
}