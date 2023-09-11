import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renti_user/utils/app_colors.dart';

class DeviceUtils{

  static void splashUtils(){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primaryColor,
        statusBarColor: Colors.transparent
      )
    );
  }
}