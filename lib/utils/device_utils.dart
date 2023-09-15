import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils{

  static void splashUtils(){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarDividerColor: Colors.transparent,
      )
    );
  }
}